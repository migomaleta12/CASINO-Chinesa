<?php

namespace App\Filament\Admin\Resources\SettingResource\Pages;

use App\Filament\Admin\Resources\SettingResource;
use App\Models\Setting;
use AymanAlhattami\FilamentPageWithSidebar\Traits\HasPageSidebar;
use Filament\Forms\Components\Section;
use Filament\Forms\Components\TextInput;
use Filament\Forms\Concerns\InteractsWithForms;
use Filament\Forms\Contracts\HasForms;
use Filament\Forms\Form;
use Filament\Notifications\Notification;
use Filament\Resources\Pages\Page;
use Filament\Support\Exceptions\Halt;
use Illuminate\Contracts\Support\Htmlable;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Cache;

class AffiliatePage extends Page implements HasForms
{
    use HasPageSidebar, InteractsWithForms;

    protected static string $resource = SettingResource::class;

    protected static string $view = 'filament.resources.setting-resource.pages.affiliate-page';

    public function getTitle(): string | Htmlable
    {
        return __('Configurações Afiliados');
    }

    public Setting $record;
    public ?array $data = [];

    public static function canView(Model $record): bool
    {
        return auth()->user()->hasRole('admin');
    }

    public function mount(): void
    {
        $setting = Setting::first();
        $this->record = $setting;
        $this->form->fill($setting->toArray());
    }

    public function save()
    {
        try {
            if (env('APP_DEMO')) {
                Notification::make()
                    ->title('Atenção')
                    ->body('Você não pode realizar esta alteração na versão demo')
                    ->danger()
                    ->send();
                return;
            }

            $setting = Setting::find($this->record->id);

            if ($setting->update($this->data)) {
                Cache::put('setting', $setting);

                Notification::make()
                    ->title('Dados alterados')
                    ->body('Dados alterados com sucesso!')
                    ->success()
                    ->send();

                redirect(route('filament.admin.resources.settings.affiliate', ['record' => $this->record->id]));
            }
        } catch (Halt $exception) {
            return;
        }
    }

    public function form(Form $form): Form
    {
        return $form
            ->schema([
                Section::make('Ajuste de Baús')
                    ->description('Ajuste conforme o necessário. O sistema já realiza a soma dos baús para você.')
                    ->schema([
                            TextInput::make('trunk_baseline')
                                ->label('Baseline')
                                ->numeric()
                                ->suffix('R$')
                                ->helperText('Valor que a pessoa precisa depositar para que o afiliado ganhe.')
                                ->maxLength(191),
                            TextInput::make('trunk_aposta')
                                ->label('Aposta')
                                ->numeric()
                                ->suffix('R$')
                                ->helperText('Quantia que a pessoa vai precisar jogar para que o afiliado ganhe.')
                                ->maxLength(191),
                            TextInput::make('trunk_valor')
                                ->label('Valor')
                                ->numeric()
                                ->suffix('R$')
                                ->helperText('Quantia que a pessoa vai ganhar por baú para cada pessoa indicada.')
                                ->maxLength(191),
                    ])->columns(3)
            ])
            ->statePath('data');
    }
}
