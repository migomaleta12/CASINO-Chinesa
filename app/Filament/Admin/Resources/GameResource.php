<?php

namespace App\Filament\Admin\Resources;

use App\Filament\Resources\GameResource\Pages;
use App\Filament\Resources\GameResource\RelationManagers;
use App\Models\Game;
use App\Models\Provider;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Filters\SelectFilter;
use Filament\Tables\Table;

class GameResource extends Resource
{
    protected static ?string $model = Game::class;

    protected static ?string $navigationIcon = 'heroicon-o-rectangle-stack';

    protected static ?string $navigationLabel = 'Todos os Jogos';

    protected static ?string $modelLabel = 'Todos os Jogos';

    /**
     * @dev @victormsalatiel
     * @return bool
     */
    public static function canAccess(): bool
    {
        return auth()->user()->hasRole('admin');
    }

    /**
     * @param Form $form
     * @return Form
     */
    public static function form(Form $form): Form
    {
        return $form
            ->schema([
               Forms\Components\Section::make('')
                ->schema([
                    Forms\Components\Group::make()
                    ->schema([
                        Forms\Components\Select::make('provider_id')
                            ->label('Provedor')
                            ->placeholder('Selecione um provedor')
                            ->relationship(name: 'provider', titleAttribute: 'name')
                            ->options(
                                fn($get) => Provider::query()
                                    ->pluck('name', 'id')
                            )
                            ->searchable()
                            ->preload()
                            ->live()
                            ->columnSpanFull()
                        ,
                        Forms\Components\Select::make('categories')
                            ->label('Categoria')
                            ->placeholder('Selecione categorias para seu jogo')
                            ->multiple()
                            ->relationship('categories', 'name')
                            ->searchable()
                            ->preload()
                            ->live()
                            ->columnSpanFull()
                        ,
                        Forms\Components\TextInput::make('game_name')
                            ->label('Nome do Jogo')
                            ->placeholder('Digite o nome do jogo')
                            ->required()
                            ->maxLength(191),
                        Forms\Components\Grid::make()
                        ->schema([
                            Forms\Components\TextInput::make('game_id')
                                ->label('ID do Jogo')
                                ->placeholder('Digite o ID do jogo')
                                ->required()
                                ->maxLength(191),
                            Forms\Components\TextInput::make('game_code')
                                ->placeholder('Digite o código do jogo')
                                ->label('Código do Jogo')
                                ->required()
                                ->maxLength(191),
                            Forms\Components\TextInput::make('game_type')
                                ->placeholder('Digite o tipo de jogo')
                                ->label('Tipo do Jogo')
                                ->required()
                                ->maxLength(191),
                        ])->columns(3),
                        
                        Forms\Components\FileUpload::make('cover')
                            ->label('Capa')
                            ->placeholder('Carregue a capa do jogo')
                            ->image()
                            ->columnSpanFull()
                            ->helperText('Tamanho recomendado para a capa é de 300x350')
                            ->required(),
                    ]),
                    Forms\Components\Group::make()
                    ->schema([
                        Forms\Components\TextInput::make('views')
                            ->label('Visualizações')
                            ->required()
                            ->numeric()
                            ->default(0),
                        Forms\Components\Toggle::make('is_featured')
                            ->label('Destaques'),
                        Forms\Components\Toggle::make('show_home')
                            ->label('Mostrar na Home'),
                        Forms\Components\Toggle::make('status')
                            ->label('Status')
                            ->helperText('Ative ou desative o jogo')
                            ->default(true)
                            ->required(),
                    ])

                ])->columns(2)
            ]);
    }

    /**
     * @param Table $table
     * @return Table
     * @throws \Exception
     */
    public static function table(Table $table): Table
    {
        return $table
            ->defaultSort('created_at', 'desc')
            ->columns([
                Tables\Columns\ImageColumn::make('cover')
                ->label('Capa')
                //->disk('media')
                ,
                Tables\Columns\TextColumn::make('provider.name')
                    ->label('Provedor')
                    ->numeric()
                    ->sortable()
                ,
                Tables\Columns\TextColumn::make('game_name')
                    ->label('Nome')
                    ->searchable(),
                Tables\Columns\ToggleColumn::make('show_home')
                    ->afterStateUpdated(function ($record, $state) {
                        if($state == 1) {
                            $record->update(['status' => 1]);
                        }
                    })
                    ->label('Exibir na Home'),
                Tables\Columns\ToggleColumn::make('is_featured')
                    ->label('Destaques'),
                Tables\Columns\TextColumn::make('game_code')
                    ->label('Código')
                    ->toggleable(isToggledHiddenByDefault: true)
                    ->searchable(),
                Tables\Columns\TextColumn::make('game_type')
                    ->toggleable(isToggledHiddenByDefault: true)
                    ->label('Tipo')
                    ->searchable(),
                Tables\Columns\ToggleColumn::make('status')
                    ->label('Status'),
                Tables\Columns\TextColumn::make('views')
                    ->icon('heroicon-o-eye')
                    ->numeric()
                    ->formatStateUsing(fn (Game $record): string => \Helper::formatNumber($record->views))
                    ->sortable(),
                Tables\Columns\TextColumn::make('created_at')
                    ->dateTime()
                    ->sortable()
                    ->toggleable(isToggledHiddenByDefault: true),
                Tables\Columns\TextColumn::make('updated_at')
                    ->dateTime()
                    ->sortable()
                    ->toggleable(isToggledHiddenByDefault: true),
            ])
            
            ->filters([
                SelectFilter::make('categories.name')
                    ->relationship('categories', 'name')
                    ->preload()
                    ->multiple()
                    ->indicator('Categoria')
                    ->searchable(),
                SelectFilter::make('Provedor')

                    ->relationship('provider', 'name')
                    ->label('Provedor')
                    ->indicator('Provedor'),
                SelectFilter::make('distribution')
                    ->label('Distribuição')
                    ->options(\Helper::getDistribution())
                    ->attribute('distribution')
            ])
            ->actions([
                Tables\Actions\ActionGroup::make([
                    Tables\Actions\EditAction::make(),
                    Tables\Actions\DeleteAction::make(),
                ]),
            ])
            ->bulkActions([
                Tables\Actions\BulkAction::make('Ativar Jogos')
                    ->icon('heroicon-m-check')
                    ->requiresConfirmation()
                    ->action(function($records) {
                        return $records->each->update(['status' => 1]);
                    }),
                Tables\Actions\BulkAction::make('Desativar Jogos')
                    ->icon('heroicon-m-x-circle')
                    ->color('danger')
                    ->requiresConfirmation()
                    ->action(function($records) {
                        return $records->each(function($record) {
                            $record->update(['status' => 0]);
                        });
                    }),
                Tables\Actions\BulkActionGroup::make([
                    Tables\Actions\DeleteBulkAction::make(),
                ]),
            ]);
    }

    public static function getRelations(): array
    {
        return [
            //
        ];
    }

    public static function getPages(): array
    {
        return [
            'index' => \App\Filament\Admin\Resources\GameResource\Pages\ListGames::route('/'),
            'create' => \App\Filament\Admin\Resources\GameResource\Pages\CreateGame::route('/create'),
            'edit' => \App\Filament\Admin\Resources\GameResource\Pages\EditGame::route('/{record}/edit'),
        ];
    }
}
