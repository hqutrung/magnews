<?php

namespace Modules\Admin\Http\Controllers;

use App\Models\Category;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Routing\Controller;
use Modules\Admin\Http\Requests\AdminCategoryRequest;
use Illuminate\Support\Str;
use PHPUnit\Framework\MockObject\Stub\ReturnReference;

class AdminCategoryController extends Controller
{
    /**
     * Display a listing of the resource.
     * @return Response
     */
    public function index()
    {
        $categories = Category::all();
        $viewdata = [
            'categories' => $categories,
        ];
        return view('admin::categories.index', $viewdata);
    }

    public function create(AdminCategoryRequest $request)
    {
        $this->insertOrUpdate($request);
        return redirect()->back();
    }
    public function insertOrUpdate(AdminCategoryRequest $request, $id = '')
    {
        $data = new Category();
        if ($id) {
            $data = Category::find($id);
        }
        $data->c_name = $request->c_name;
        $data->c_slug = Str::slug($request->c_name);
        $data->c_description = $request->c_description;
        $data->c_active = $request->c_active ? 1 : 0;
        $data->c_hot = $request->c_hot ? 1 : 0;
        $data->c_parent_id = $request->c_parent_id;
        $data->c_show_home = $request->c_show_home ? 1 : 0;
        $data->save();
        return redirect()->back();
    }

    /**
     * Store a newly created resource in storage.
     * @param Request $request
     * @return Response
     */
    public function store(Request $request)
    {
        //
    }

    public function action(Request $request, $action, $id)
    {
        $category = Category::find($id);
        switch ($action) {
            case 'delete':
                $category->delete();
                break;
            case 'edit':
                $categories = Category::all();
                $viewdata = [
                    'categories' => $categories,
                    'category' => $category
                ];
                return view('admin::categories.index', $viewdata);
            case 'active':
                $category->c_active = $category->c_active ? 0 : 1;
                $category->save();
                break;
        }
        return redirect()->back();
    }

    /**
     * Show the form for editing the specified resource.
     * @param int $id
     * @return Response
     */


    public function update(AdminCategoryRequest $request, $id)
    {
        $this->insertOrUpdate($request, $id);
        return redirect()->back();
    }
}
