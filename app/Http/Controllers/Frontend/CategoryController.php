<?php

namespace App\Http\Controllers\Frontend;

use App\Models\Category;
use App\Models\Post;
use Illuminate\Http\Request;

class CategoryController extends FrontendController
{
    public function __construct()
    {
        parent::__construct();
    }
    public function index(Request $request)
    {
        $url = $request->segment(2);
        $url = preg_split('/(-)/i', $url);
        $id = array_pop($url);
        $category = Category::find($id);
        $posts = Post::where([
            'p_category_id' => $id,
        ])->orderBy('id', 'DESC')->paginate(12);
        $viewdata = [
            'posts' => $posts,
            'category' => $category,
        ];
        return view('frontend.category.index', $viewdata);
    }
}
