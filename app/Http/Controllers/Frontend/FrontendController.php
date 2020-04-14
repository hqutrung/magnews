<?php

namespace App\Http\Controllers\Frontend;

use App\Http\Controllers\Controller;
use App\Models\Category;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\View;

class FrontendController extends Controller
{
    public function __construct()
    {
        $categories = Category::where([
            'c_active' => Category::STATUS_PUBLIC,
        ])->get();
        View::share('categories', $categories);
    }
}
