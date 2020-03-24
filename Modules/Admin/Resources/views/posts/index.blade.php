@extends('admin::layouts.master')
@section('content')

<!-- Content Header (Page header) -->
<section class="content-header">
    <h1>
        Dashboard
        <small>Version 2.0</small>
        <a href="{{route('admin.post.create')}}" class="btn btn-primary">Thêm mới</a>

    </h1>
    <ol class="breadcrumb">
        <li><a href="{{route('admin.home')}}"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">Bài viết</li>
    </ol>
</section>
<section class="content">
    <div class="table">
        <div class="box">
            <div class="box-header">
                <h3 class="box-title">Quản lý bài viết</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
                <table id="example2" class="table table-bordered table-hover">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Tên bài viết</th>
                            <th>Slug</th>
                            <th>Lượt view</th>
                            <th>Trạng thái</th>
                            <th>Tác vụ</th>
                        </tr>
                    </thead>
                    <tbody>
                        @if(isset($posts))
                        @foreach($posts as $post)
                        <tr>
                            <td>{{$post->id}}</td>
                            <td><a href="{{route('admin.get.action.post',['edit',$post->id])}}">{{$post->p_name}}</a></td>
                            <td>{{$post->p_slug}}</td>
                            <td>{{$post->p_view}}</td>
                            <td><a href="{{route('admin.get.action.post',['active',$post->id])}}" class="btn {{$post->getStatus($post->p_active)['class']}}">{{$post->getStatus($post->p_active)['name']}}</a></td>
                            <td>
                                <a href="{{route('admin.get.action.post',['edit',$post->id])}}" class="btn btn-success"> Sửa</a>
                                <a href="{{route('admin.get.action.post',['delete',$post->id])}}" class="btn btn-danger"> Xóa</a>
                            </td>
                        </tr>
                        @endforeach
                        @endif
                    </tbody>
                    <tfoot>
                        <tr>
                            <th>ID</th>
                            <th>Tên bài viết</th>
                            <th>Slug</th>
                            <th>Lượt view</th>
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