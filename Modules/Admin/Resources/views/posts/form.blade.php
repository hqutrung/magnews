@section('css')
<link rel="stylesheet" href="{{asset('adminAssets')}}/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css">
@endsection
<form action="" method="POST" enctype="multipart/form-data">
    @csrf
    <div class="row">
        <div class="col-sm-9">
            <div class="box box-info">
                <div class="box-header with-border">
                    <h3 class="box-title">Thông tin bài viết</h3>
                    <div class="box-tools pull-right">
                        <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                        </button>
                    </div>
                </div>
                <!-- /.box-header -->
                <div class="box-body">
                    <div class="form-group">
                        <label>Tên bài viết</label>
                        <input type="text" id="title" class="form-control @error('p_name') is-invalid @enderror" onkeyup="ChangeToSlug();" value="{{isset($post->p_name)?$post->p_name:''}}" name="p_name" placeholder="">
                        @error('p_name')
                        <div class="alert alert-danger">{{ $message }}</div>
                        @enderror
                    </div>
                    <div class="form-group">
                        <label>Slug</label>
                        <input type="text" id='slug' class="form-control @error('p_slug') is-invalid @enderror" value="{{isset($post->p_slug)?$post->p_slug:''}}" name="p_slug" placeholder="">
                        @error('p_slug')
                        <div class="alert alert-danger">{{ $message }}</div>
                        @enderror
                    </div>
                    <div class="form-group">
                        <label for="">Nội dung bài viết</label>
                        <textarea class="textarea" name="p_content" style="width: 100%; height: 500px; font-size: 14px; line-height: 18px; border: 1px solid #dddddd; padding: 10px;">{{isset($post->p_content)?$post->p_content:''}}</textarea>
                    </div>
                </div>
                <!-- /.box-body -->
            </div>
            <div class="box box-info">
                <div class="box-header with-border">
                    <h3 class="box-title">SEO</h3>
                    <div class="box-tools pull-right">
                        <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                        </button>
                    </div>
                </div>
                <div class="box-body">

                    <div class="form-group">
                        <label>Title SEO</label>
                        <input type="text" class="form-control @error('p_title_seo') is-invalid @enderror" value="{{isset($post->p_title_seo)?$post->p_title_seo:''}}" name="p_title_seo" placeholder="">
                        @error('p_title_seo')
                        <div class="alert alert-danger">{{ $message }}</div>
                        @enderror
                    </div>
                    <div class="form-group">
                        <label for="">Description SEO</label>
                        <textarea name="p_description_seo" style="width: 100%; height: 100px; font-size: 14px; line-height: 18px; border: 1px solid #dddddd; padding: 10px;">{{isset($post->p_description_seo)?$post->p_description_seo:''}}</textarea>
                        @error('p_description_seo')
                        <div class="alert alert-danger">{{ $message }}</div>
                        @enderror
                    </div>
                </div>
            </div>
        </div>
        <div class="col-sm-3">
            <div class="box box-info">
                <div class="box-header with-border">
                    <h3 class="box-title">Thêm bài viết</h3>
                    <div class="box-tools pull-right">
                        <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                        </button>
                    </div>
                </div>
                <!-- /.box-header -->
                <div class="box-body">
                    <div class="form-group">
                        @if(isset($post))
                        <button type="submit" class="btn btn-success">Cập nhật</button>

                        @else
                        <button type="submit" class="btn btn-info">Thêm bài viết</button>
                        @endif
                    </div>
                    <div class="form-group">
                        <div class="form-check form-check-inline">
                            <label class="form-check-label">
                                <input class="form-check-input" type="checkbox" name="p_active" {{isset($post) && $post->p_active==1 ? "checked" : ""}} value="1"> Công khai
                            </label>
                        </div>
                        <div class="form-check form-check-inline">
                            <label class="form-check-label">
                                <input class="form-check-input" type="checkbox" name="p_hot" {{isset($post) && $post->p_hot==1 ? "checked" : ""}} value="1"> HOT
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label>Chuyên mục</label>
                        <select class="form-control" name="p_category_id">
                            @if(isset($categories))
                            @foreach($categories as $category)
                            <option value="{{$category->id}}" {{isset($post) && $post->p_category_id== $category->id ? "selected" : ""}}>{{$category->c_name}}</option>
                            @endforeach
                            @endif
                        </select>
                    </div>
                </div>
                <!-- /.box-body -->
            </div>
            <div class="box box-info">
                <div class="box-header with-border">
                    <h3 class="box-title">Ảnh</h3>
                    <div class="box-tools pull-right">
                        <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                        </button>
                    </div>
                </div>
                <!-- /.box-header -->
                <div class="box-body">
                    <div class="form-group">
                        <img src="{{isset($post->p_avatar) ? pare_url_file($post->p_avatar): asset('images/no-image.png')}}" alt="" style="width:100%" id='outputImg'>
                        <input id='inputImg' type="file" name="p_avatar" class="btn form-control">
                    </div>
                </div>
                <!-- /.box-body -->
            </div>
        </div>
    </div>
</form>
@section('script')
<script src="{{asset('adminAssets')}}/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"></script>
<script>
    $(function() {
        $('.textarea').wysihtml5()
    })
</script>
<script>
</script>
@endsection