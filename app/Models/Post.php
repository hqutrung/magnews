<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Arr;
use App\Models\Category;

class Post extends Model
{
    protected $table = 'posts';
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
        return Arr::get($this->status, $this->p_active, '[N/A]');
    }

    public function category()
    {
        return $this->belongsTo(Category::class, 'p_category_id');
    }
}
