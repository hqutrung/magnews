<?php

namespace Modules\Admin\Http\Controllers;

use App\Models\Category;
use App\Models\Post;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Routing\Controller;
use Modules\Admin\Http\Requests\AdminPostRequest;

class AdminPostController extends Controller
{
    /**
     * Display a listing of the resource.
     * @return Response
     */
    public function index()
    {
        $posts = Post::all();
        $viewdata = [
            'posts' => $posts,
        ];
        return view('admin::posts.index', $viewdata);
    }
    public function create()
    {
        $categories = Category::all();
        $viewdata = [
            'categories' => $categories,
            
        ];
        return view('admin::posts.create', $viewdata);
    }

    /**
     * Show the form for creating a new resource.
     * @return Response
     */
    public function store(AdminPostRequest $request)
    {
        $this->insertOrUpdate($request);
        return redirect()->back();
    }

    public function insertOrUpdate(AdminPostRequest $request, $id = '')
    {
        $data = new Post();
        if ($id) {
            $data = Post::find($id);
        }
        $data->p_name = $request->p_name;
        $data->p_slug = $request->p_slug;
        $data->p_content = $request->p_content;
        $data->p_title_seo = $request->p_title_seo;
        $data->p_hot = $request->p_hot ? 1 : 0;
        $data->p_active = $request->p_active ? 1 : 0;
        $data->p_description_seo = $request->p_description_seo;
        $data->p_category_id = $request->p_category_id;
        if ($request->hasFile('p_avatar')) {
            $file = upload_image('p_avatar');
            if (isset($file['name'])) {
                $data->p_avatar = $file['name'];
            }
        }
        $data->save();
    }

    /**
     * Show the specified resource.
     * @param int $id
     * @return Response
     */
    public function action(Request $request, $action, $id)
    {
        $post = Post::find($id);
        switch ($action) {
            case 'delete':
                $post->delete();
                break;
            case 'edit':
                $categories = Category::all();
                $viewdata = [
                    'categories' => $categories,
                    'post' => $post,
                ];
                return view('admin::posts.create', $viewdata);
            case 'active':
                $post->p_active = $post->p_active ? 0 : 1;
                $post->save();
                break;
        }
        return redirect()->back();
    }

    /**
     * Show the form for editing the specified resource.
     * @param int $id
     * @return Response
     */
    public function edit($id)
    {
        return view('admin::edit');
    }

    /**
     * Update the specified resource in storage.
     * @param Request $request
     * @param int $id
     * @return Response
     */
    public function update(AdminPostRequest $request, $id)
    {
        $this->insertOrUpdate($request, $id);
        return redirect()->back();
    }

    /**
     * Remove the specified resource from storage.
     * @param int $id
     * @return Response
     */
    public function destroy($id)
    {
        //
    }
}
