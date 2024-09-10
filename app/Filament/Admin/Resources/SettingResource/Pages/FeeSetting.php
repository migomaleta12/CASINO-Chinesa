<?php

namespace App\Filament\Admin\Resources\SettingResource\Pages;

use App\Filament\Admin\Resources\SettingResource;
use App\Models\Setting;
use AymanAlhattami\FilamentPageWithSidebar\Traits\HasPageSidebar;
use Filament\Forms\Components\Grid;
use Filament\Forms\Components\Section;
use Filament\Forms\Components\TextInput;
use Filament\Forms\Components\Toggle;
use Filament\Forms\Concerns\InteractsWithForms;
use Filament\Forms\Contracts\HasForms;
use Filament\Forms\Form;
use Filament\Notifications\Notification;
use Filament\Resources\Pages\Page;
use Filament\Support\Exceptions\Halt;
use Illuminate\Contracts\Support\Htmlable;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Cache;

class FeeSetting extends Page implements HasForms
{
    use HasPageSidebar, InteractsWithForms;

    protected static string $resource = SettingResource::class;

    protected static string $view = 'filament.resources.setting-resource.pages.fee-setting';

    /**
     * @dev @victormsalatiel
     * @param Model $record
     * @return bool
     */
    public static function canView(Model $record): bool
    {
        return auth()->user()->hasRole('admin');
    }

    /**
     * @return string|Htmlable
     */
    public function getTitle(): string | Htmlable
    {
        return __('Taxas');
    }

    public Setting $record;
    public ?array $data = [];

    /**
     * @dev victormsalatiel - Meu instagram
     * @return void
     */
    public function mount(): void
    {
        $setting = Setting::first();
        $this->record = $setting;
        $this->form->fill($setting->toArray());
    }

    /**
     * @dev victormsalatiel - Meu instagram
     * @return void
     */
    public function save()
    {
        try {
            if(env('APP_DEMO')) {
                Notification::make()
                    ->title('Atenção')
                    ->body('Você não pode realizar esta alteração na versão demo')
                    ->danger()
                    ->send();
                return;
            }

            $setting = Setting::find($this->record->id);

            if($setting->update($this->data)) {
                Cache::put('setting', $setting);

                Notification::make()
                    ->title('Dados alterados')
                    ->body('Dados alterados com sucesso!')
                    ->success()
                    ->send();

                redirect(route('filament.admin.resources.settings.fee', ['record' => $this->record->id]));

            }
        } catch (Halt $exception) {
            return;
        }
    }

    /**
     * @dev victormsalatiel - Meu instagram
     * @param Form $form
     * @return Form
     */
    public function form(Form $form): Form
    {
        return $form
            ->schema([
                Section::make('Ajuste de Taxas')
                    ->description('Formulário ajustar as taxas da plataforma')
                    ->schema([
                        Grid::make()->schema([
                            TextInput::make('cpa_baseline')
                                ->label('CPA Baseline')
                                ->helperText('Este é o valor que precisa ser depositado para o afiliado ganhar o CPA')
                                ->numeric()
                                ->suffix('R$ ')
                                ->maxLength(191),
                            TextInput::make('cpa_value')
                                ->label('CPA Valor')
                                ->helperText('Este é o valor que será recebido pelo afiliado.')
                                ->numeric()
                                ->suffix('R$')
                                ->maxLength(191),
                            TextInput::make('cpa_percentage_baseline')
                                ->label('CPA BASELINE (%)')
                                ->numeric()
                                ->suffix('R$')
                                ->helperText('Quanto é nescessario depositar para ativar o CPA %')
                                ->maxLength(191),
                            TextInput::make('cpa_percentage')
                                ->label('CPA (%)')
                                ->numeric()
                                ->suffix('%')
                                ->helperText('Seu afiliado vai receber a % definida aqui do depósito do seu indicado!')
                                ->maxLength(191),
                            TextInput::make('revshare_percentage')
                                ->label('RevShare (%)')
                                ->numeric()
                                ->suffix('%')
                                ->helperText('Este é o revshare padrão para cada usuário que se candidata a ser afiliado.')
                                ->maxLength(191),
                            TextInput::make('ngr_percent')
                                ->helperText('Esta taxa é deduzida dos ganhos do afiliado para plataforma.')
                                ->label('NGR (%)')
                                ->numeric()
                                ->suffix('%')
                                ->maxLength(191),
                            Toggle::make('revshare_reverse')
                                ->inline(true)
                                ->label('Ativar RevShare Negativo')
                                ->helperText('Esta opção possibilita que o afiliado acumule saldos negativos decorrentes das perdas geradas pelos seus indicados.')
                        ])
                    ])
            ])
            ->statePath('data');
    }
}
