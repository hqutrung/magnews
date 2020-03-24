@extends('admin::layouts.master')
@section('content')

<!-- Content Header (Page header) -->
<section class="content-header">
    <h1>
        Dashboard
        <small>Version 2.0</small>
    </h1>
    <ol class="breadcrumb">
        <li><a href="{{route('admin.home')}}"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">Thêm bài viết</li>
    </ol>
</section>
<section class="content">
    @include('admin::posts.form')
</section>
@endsection