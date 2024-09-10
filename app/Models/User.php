<?php

namespace App\Models;

use Attribute;
use Carbon\Carbon;
use Filament\Models\Contracts\FilamentUser;
use Filament\Panel;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\Relations\HasOne;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Illuminate\Support\Facades\Hash;
use Laravel\Sanctum\HasApiTokens;
use Spatie\Permission\Models\Role;
use Spatie\Permission\Traits\HasRoles;
use Tymon\JWTAuth\Contracts\JWTSubject;

class User extends Authenticatable implements FilamentUser, JWTSubject
{
    use HasApiTokens, HasFactory, Notifiable, HasRoles;

    protected static function booted()
    {
        parent::created(function (User $user) {
            $user->createWallet($user);
        }); 

        parent::deleted(function (User $user) {
            $user->deleteAll($user);
        }); 
    }

    public function deleteAll($user)
    {
        $wallet = Wallet::find($user->id);
        if(!empty($wallet)) {
            $wallet->delete();
        }

        $affiliateHistory = AffiliateHistory::where('user_id', $user->id)->get();
        foreach($affiliateHistory as $affh) {
            $affh->delete();
        }

        $affiliateWithdraw = AffiliateWithdraw::where('user_id', $user->id)->get();
        foreach($affiliateWithdraw as $affw) {
            $affw->delete();
        }

        $deposits = Deposit::where('user_id', $user->id)->get();
        foreach($deposits as $dep) {
            $dep->delete();
        }

        $likes = Like::where('user_id', $user->id)->get();
        foreach($likes as $lk) {
            $lk->delete();
        }

        $transactions = Transaction::where('user_id', $user->id)->get();
        foreach($transactions as $trans) {
            $trans->delete();
        }

        $withdrawals = Withdrawal::where('user_id', $user->id)->get();
        foreach($withdrawals as $wts) {
            $wts->delete();
        }
    }

    public function createWallet($user)
    {
        $setting = \Helper::getSetting();

        Wallet::create([
            'user_id'   => $user->id,
            'currency'  => $setting->currency_code,
            'symbol'    => $setting->prefix,
            'active'    => 1
        ]);
    }

    protected $fillable = [
        'role_id',
        'avatar',
        'name',
        'last_name',
        'cpf',
        'phone',
        'email',
        'password',
        'logged_in',
        'banned',
        'inviter',
        'inviter_code',
        'affiliate_revenue_share',
        'affiliate_revenue_share_fake',
        'affiliate_cpa',
        'affiliate_baseline',
        'affiliate_percentage_cpa',
        'affiliate_percentage_baseline',
        'affiliate_bau_baseline',
        'affiliate_bau_aposta',
        'affiliate_bau_value',
        'is_demo_agent',
        'is_admin',
        'language',
        'role_id',
    ];

    protected $hidden = [
        'password',
        'remember_token',
    ];

    protected $casts = [
        'email_verified_at' => 'datetime',
        'password' => 'hashed',
    ];

    protected $appends = ['dateHumanReadable', 'createdAt', 'totalLikes'];

    public function favorites(): HasMany
    {
        return $this->hasMany(GameFavorite::class);
    }

    public function likes(): HasMany
    {
        return $this->hasMany(Like::class);
    }

    protected function password(): Attribute
    {
        return Attribute::make(
            set: fn (string $value) => Hash::make($value),
        );
    }

    public function affiliate(): BelongsTo
    {
        return $this->belongsTo(User::class, 'inviter', 'id');
    }

    public function wallet(): HasOne
    {
        return $this->hasOne(Wallet::class)->where('active', 1);
    }

    public function roles(): BelongsToMany
    {
        return $this->belongsToMany(Role::class, 'model_has_roles', 'model_id', 'role_id');
    }

    public function deposits(): HasMany
    {
        return $this->hasMany(Deposit::class);
    }

    public function canAccessPanel(Panel $panel): bool
    {
        return $this->hasRole(['admin', 'afiliado']);
    }

    public function getTotalLikesAttribute()
    {
        return $this->likes()->count();
    }

    public function getCreatedAtAttribute()
    {
        return Carbon::parse($this->attributes['created_at'])->format('Y-m-d');
    }

    public function getDateHumanReadableAttribute()
    {
        return Carbon::parse($this->created_at)->diffForHumans();
    }

    public function getJWTIdentifier()
    {
        return $this->getKey();
    }

    public function getJWTCustomClaims()
    {
        return [];
    }

}

