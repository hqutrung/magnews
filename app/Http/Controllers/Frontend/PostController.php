<?php

namespace App\Http\Controllers\Frontend;

use App\Models\Post;
use Illuminate\Http\Request;

class PostController extends FrontendController
{
    public function __construct()
    {
        parent::__construct();
    }
    public function index(Request $request)
    {
        $url = $request->segment(1);
        $url = preg_split('/(-)/i', $url);
        $id = array_pop($url);
        $post = Post::find($id);
        $viewdata = [
            'post' => $post,
        ];
        return view('frontend.post.index', $viewdata);
    }
}
