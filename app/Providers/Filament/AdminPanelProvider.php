<?php

namespace App\Providers\Filament;

use Althinect\FilamentSpatieRolesPermissions\FilamentSpatieRolesPermissionsPlugin;
use App\Filament\Admin\Pages\AdvancedPage;
use App\Filament\Admin\Pages\DashboardAdmin;
use App\Filament\Admin\Pages\GamesKeyPage;
use App\Filament\Admin\Pages\GatewayPage;
use App\Filament\Admin\Pages\LayoutCssCustom;
use App\Filament\Admin\Pages\SettingMailPage;
use App\Filament\Admin\Pages\SettingSpin;
use App\Filament\Admin\Pages\SuitPayPaymentPage;
use App\Filament\Admin\Resources\AffiliateWithdrawResource;
use App\Filament\Admin\Resources\BannerResource;
use App\Filament\Admin\Resources\CategoryResource;
use App\Filament\Admin\Resources\DepositResource;
use App\Filament\Admin\Resources\GameResource;
use App\Filament\Admin\Resources\MissionResource;
use App\Filament\Admin\Resources\OrderResource;
use App\Filament\Admin\Resources\ProviderResource;
use App\Filament\Admin\Resources\SettingResource;
use App\Filament\Admin\Resources\UserResource;
use App\Filament\Admin\Resources\VipResource;
use App\Filament\Admin\Resources\WalletResource;
use App\Filament\Admin\Resources\WithdrawalResource;
use App\Livewire\AdminWidgets;
use App\Livewire\WalletOverview;
use Filament\Http\Middleware\Authenticate;
use Filament\Http\Middleware\DisableBladeIconComponents;
use Filament\Http\Middleware\DispatchServingFilamentEvent;
use Filament\Navigation\NavigationBuilder;
use Filament\Navigation\NavigationGroup;
use Filament\Navigation\NavigationItem;
use Filament\Panel;
use Filament\PanelProvider;
use Filament\Support\Colors\Color;
use Illuminate\Cookie\Middleware\AddQueuedCookiesToResponse;
use Illuminate\Cookie\Middleware\EncryptCookies;
use Illuminate\Foundation\Http\Middleware\VerifyCsrfToken;
use Illuminate\Routing\Middleware\SubstituteBindings;
use Illuminate\Session\Middleware\AuthenticateSession;
use Illuminate\Session\Middleware\StartSession;
use Illuminate\View\Middleware\ShareErrorsFromSession;
use App\Http\Middleware\CheckAdmin;
use Illuminate\Support\Facades\Route; // Importação da classe Route

class AdminPanelProvider extends PanelProvider
{
    /**
     * @param Panel $panel
     * @return Panel
     */
    public function panel(Panel $panel): Panel
    {
        return $panel
            ->default()
            ->id('admin')
            ->path('ondagames/admin')
            ->login()
            ->colors([
                'danger' => Color::Red,
                'gray' => Color::Slate,
                'info' => Color::Blue,
                'primary' => Color::Indigo,
                'success' => Color::Emerald,
                'warning' => Color::Orange,
            ])
            ->font('Roboto Condensed')
            ->brandLogo(fn () => view('filament.components.logo'))
            ->discoverResources(in: app_path('Filament/Admin/Resources'), for: 'App\\Filament\\Admin\\Resources')
            ->discoverPages(in: app_path('Filament/Admin/Pages'), for: 'App\\Filament\\Admin\\Pages')
            ->pages([
                DashboardAdmin::class,
            ])
            ->globalSearchKeyBindings(['command+k', 'ctrl+k'])
            ->sidebarCollapsibleOnDesktop()
            ->collapsibleNavigationGroups(true)
            ->discoverWidgets(in: app_path('Filament/Admin/Widgets'), for: 'App\\Filament\\Admin\\Widgets')
            ->widgets([
                WalletOverview::class,
                AdminWidgets::class,
            ])
            ->navigation(function (NavigationBuilder $builder): NavigationBuilder {
                return $builder->groups([
                    NavigationGroup::make()
                        ->items([
                            NavigationItem::make('dashboard')
                                ->icon('heroicon-o-home')
                                ->label(fn (): string => __('filament-panels::pages/dashboard.title'))
                                ->url(fn (): string => DashboardAdmin::getUrl())
                                ->isActiveWhen(fn () => request()->routeIs('filament.pages.dashboard')),

                            NavigationItem::make('settings')
                                ->icon('heroicon-o-cog-6-tooth')
                                ->label(fn (): string => 'Configurações')
                                ->url(fn (): string => SettingResource::getUrl())
                                ->isActiveWhen(fn () => request()->routeIs('filament.admin.resources.settings.*'))
                                ->visible(fn(): bool => auth()->user()->hasRole('admin')),


                            NavigationItem::make('games-key')
                                ->icon('heroicon-o-cog-6-tooth')
                                ->label(fn (): string => 'API de jogos')
                                ->url(fn (): string => GamesKeyPage::getUrl())
                                ->isActiveWhen(fn () => request()->routeIs('filament.admin.resources.games-key.*'))
                                ->visible(fn(): bool => auth()->user()->hasRole('admin')),

                            NavigationItem::make('setting-mail')
                                ->icon('heroicon-o-cog-6-tooth')
                                ->label(fn (): string => 'Definições de Email')
                                ->url(fn (): string => SettingMailPage::getUrl())
                                ->isActiveWhen(fn () => request()->routeIs('filament.admin.resources.setting-mail.*'))
                                ->visible(fn(): bool => auth()->user()->hasRole('admin')),

                            NavigationItem::make('withdraw_affiliates')
                                ->icon('heroicon-o-banknotes')
                                ->label(fn (): string => 'Saques de Afiliados')
                                ->url(fn (): string => AffiliateWithdrawResource::getUrl())
                                ->isActiveWhen(fn () => request()->routeIs('filament.admin.resources.withdraw-affiliates.*'))
                                ->visible(fn(): bool => auth()->user()->hasRole('admin')),
                        ]),

                    auth()->user()->hasRole('admin') ?
                        NavigationGroup::make('Meus Jogos')
                            ->items(array_merge(
                                CategoryResource::getNavigationItems(),
                                ProviderResource::getNavigationItems(),
                                GameResource::getNavigationItems(),
                                OrderResource::getNavigationItems(),
                            ))
                        : NavigationGroup::make(),

                    auth()->user()->hasRole('admin') ?
                        NavigationGroup::make('Pagamentos')
                            ->items([
                                NavigationItem::make('gateway')
                                    ->icon('heroicon-o-cog-6-tooth')
                                    ->label(fn (): string => 'Gateway de Pagamentos')
                                    ->url(fn (): string => GatewayPage::getUrl())
                                    ->isActiveWhen(fn () => request()->routeIs('filament.admin.resources.gateway-page.*'))
                                    ->visible(fn(): bool => auth()->user()->hasRole('admin')),

                            ])
                        : NavigationGroup::make(),

                    auth()->user()->hasRole('admin') ?
                        NavigationGroup::make('Customização')
                            ->items(array_merge(
                                BannerResource::getNavigationItems(),
                                [
                                    NavigationItem::make('custom-layout')
                                        ->icon('heroicon-o-paint-brush')
                                        ->label(fn (): string => 'Customização')
                                        ->url(fn (): string => LayoutCssCustom::getUrl())
                                        ->isActiveWhen(fn () => request()->routeIs('filament.admin.resources.layout-css-custom.*'))
                                        ->visible(fn(): bool => auth()->user()->hasRole('admin'))
                                ]
                            ))
                        : NavigationGroup::make(),

                    auth()->user()->hasRole('admin') ?
                        NavigationGroup::make('Administração')
                            ->items(array_merge(
                                UserResource::getNavigationItems(),
                                WalletResource::getNavigationItems(),
                                DepositResource::getNavigationItems(),
                                WithdrawalResource::getNavigationItems(),
                            ))
                        : NavigationGroup::make(),

                    // Grupo de navegação para gerenciamento de papéis e permissões
                    NavigationGroup::make(__('filament-spatie-roles-permissions::filament-spatie.section.roles_and_permissions'))
                        ->items([
                            NavigationItem::make(__('filament-spatie-roles-permissions::filament-spatie.section.role'))
                                ->icon('heroicon-o-user-group')
                                ->isActiveWhen(fn () => request()->routeIs([
                                    'filament.admin.resources.roles.index',
                                    'filament.admin.resources.roles.create',
                                    'filament.admin.resources.roles.view',
                                    'filament.admin.resources.roles.edit',
                                ]))
                                ->url(fn (): string => '/ondagames/admin/roles'),
                            NavigationItem::make(__('filament-spatie-roles-permissions::filament-spatie.section.permission'))
                                ->icon('heroicon-o-lock-closed')
                                ->isActiveWhen(fn () => request()->routeIs([
                                    'filament.admin.resources.permissions.index',
                                    'filament.admin.resources.permissions.create',
                                    'filament.admin.resources.permissions.view',
                                    'filament.admin.resources.permissions.edit',
                                ]))
                                ->url(fn (): string => '/ondagames/admin/permissions'),
                        ]),

                    NavigationGroup::make('maintenance')
                        ->label('Manutenção')
                        ->items([
                            NavigationItem::make('Limpar o cache')
                                ->url(url('/clear'))
                                ->icon('heroicon-o-trash')
                        ]),
                ]);
            })
            ->middleware([
                EncryptCookies::class,
                AddQueuedCookiesToResponse::class,
                StartSession::class,
                AuthenticateSession::class,
                ShareErrorsFromSession::class,
                VerifyCsrfToken::class,
                SubstituteBindings::class,
                DisableBladeIconComponents::class,
                DispatchServingFilamentEvent::class,
                CheckAdmin::class,
            ])
            ->authMiddleware([
                Authenticate::class,
            ])
            ->plugin(FilamentSpatieRolesPermissionsPlugin::make());
    }
}
