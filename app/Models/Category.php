<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Arr;

class Category extends Model
{
    protected $table = 'categories';
    protected $guarded = [''];

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
}
