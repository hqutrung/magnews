@extends('admin::layouts.master')
@section('content')

<!-- Content Header (Page header) -->
<section class="content-header">
    <h1>
        Dashboard
        <small>Version 2.0</small>
        @if(isset($category))
        <a href="{{route('admin.category.get')}}" class="btn btn-primary">Thêm mới</a>
        @endif

    </h1>
    <ol class="breadcrumb">
        <li><a href="{{route('admin.home')}}"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">Chuyên mục</li>
    </ol>
</section>
<section class="content">
    @include('admin::categories.form')
    <button class="show-form"><i class="fa fa-angle-right"></i></button>
    <div class="table">
        <div class="box">
            <div class="box-header">
                <h3 class="box-title">Quản lý chuyên mục</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
                <table id="example2" class="table table-bordered table-hover">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Tên chuyên mục</th>
                            <th>Slug</th>
                            <th>Số bài viết</th>
                            <th>Trạng thái</th>
                            <th>Tác vụ</th>
                        </tr>
                    </thead>
                    <tbody>
                        @if(isset($categories))
                        @foreach($categories as $category)
                        <tr>
                            <td>{{$category->id}}</td>
                            <td>{{$category->c_name}}</td>
                            <td>{{$category->c_slug}}</td>
                            <td>{{$category->c_total}}</td>
                            <td><a href="{{route('admin.get.action.category',['active',$category->id])}}" class="btn {{$category->getStatus($category->c_active)['class']}}">{{$category->getStatus($category->c_active)['name']}}</a></td>
                            <td>
                                <a href="{{route('admin.get.action.category',['edit',$category->id])}}" class="btn btn-success"> Sửa</a>
                                <a href="{{route('admin.get.action.category',['delete',$category->id])}}" class="btn btn-danger"> Xóa</a>
                            </td>
                        </tr>
                        @endforeach
                        @endif
                    </tbody>
                    <tfoot>
                        <tr>
                            <th>ID</th>
                            <th>Tên chuyên mục</th>
                            <th>Slug</th>
                            <th>Số bài viết</th>
                            <th>Trạng thái</th>
                            <th>Tác vụ</th>
                        </tr>
                    </tfoot>
                </table>
            </div>
            <!-- /.box-body -->
        </div>
    </div>
</section>
@endsection
@section('script')
<script>
    $(document).ready(function() {
        $(".show-form").hide();
        $("#hidden").click(function() {
            $(".input-cate").hide(500);
            $(".show-form").show();
        });
        $(".show-form").click(function() {
            $(".input-cate").show(500);
            $(".show-form").hide();
        });
    });
</script>
@endsection