<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Arr;


class Category extends Model
{
    protected $table = 'categories';
    protected $guarded = [''];

    const STATUS_PUBLIC = 1;
    const STATUS_PRIVATE = 0;

    const HOT_ON = 1;
    const HOT_OFF = 0;

    protected $status = [
        1 => [
            'name' => 'Công khai',
            'class' => 'btn-primary'
        ],
        0 => [
            'name' => 'Riêng tư',
            'class' => 'btn-danger'
        ]
    ];

    public function getStatus()
    {
        return Arr::get($this->status, $this->c_active, '[N/A]');
    }
    public function getListPostHome()
    {
        return $this->hasMany(Post::class,'p_category_id')->take(4);
    }
}
