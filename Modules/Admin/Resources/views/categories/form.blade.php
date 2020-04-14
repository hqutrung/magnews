<div class="input-cate">
    <div class="box box-warning">
        <div class="box-header with-border">
            @if(isset($category))
            <h3 class="box-title">Sửa chuyên mục</h3>
            @else
            <h3 class="box-title">Thêm chuyên mục</h3>
            @endif
            <i class="pull-right fa fa-angle-left" id="hidden"></i>
        </div>
        <!-- /.box-header -->
        <div class="box-body">
            <form role="form" method="POST" action="">
                @csrf
                <!-- text input -->
                <div class="form-group">
                    <label>Tên chuyên mục</label>
                    <input type="text" class="form-control @error('c_name') is-invalid @enderror" value="{{isset($category->c_name)?$category->c_name:''}}" name="c_name" placeholder="Nhập tên chuyên mục ...">
                    @error('c_name')
                    <div class="alert alert-danger">{{ $message }}</div>
                    @enderror
                </div>
                <!-- textarea -->
                <div class="form-group">
                    <label>Mô tả</label>
                    <textarea class="form-control" rows="3" name="c_description" value="{{isset($category->c_descriptiopn)?$category->c_name:''}}" placeholder="Nhập mô tả ..."></textarea>
                </div>
                <div class="row">
                    <div class="col-sm-3">
                        <div class="form-group">
                            <label>Chuyên mục cha</label>
                            <select class="form-control" name="c_parent_id">
                                <option value="0" selected>Không</option>
                                @if(isset($categories))
                                @foreach($categories as $cate)
                                <option value="{{$cate->id}}" {{isset($category) && $category->c_parent_id== $cate->id ? "selected" : ""}}>{{$cate->c_name}}</option>
                                @endforeach
                                @endif
                            </select>
                        </div>
                    </div>

                    <div class="col-sm-3">
                        <div class="form-group">
                            <div class="form-check form-check-inline">
                                <label class="form-check-label">
                                    <input class="form-check-input" type="checkbox" name="c_active" id="" value="1" {{isset($category) && $category->c_active == 1 ? "checked" :''}}> Công khai
                                </label>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-3">
                        <div class="form-group">
                            <div class="form-check form-check-inline">
                                <label class="form-check-label">
                                    <input class="form-check-input" type="checkbox" name="c_show_home" id="" value="1" {{isset($category) && $category->c_show_home == 1 ? "checked" :''}}> Hiển thị trang chủ
                                </label>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-3">
                        <div class="form-group">
                            <div class="form-check form-check-inline">
                                <label class="form-check-label">
                                    <input class="form-check-input" type="checkbox" name="c_hot" id="" value="1" {{isset($category) && $category->c_hot == 1 ? "checked" :''}}> HOT
                                </label>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="box-footer">
                    @if(isset($category))
                    <button type="submit" class="btn btn-success">Lưu</button>
                    @else
                    <button type="submit" class="btn btn-primary">Thêm chuyên mục</button>
                    @endif
                </div>
            </form>
        </div>
        <!-- /.box-body -->
    </div>
</div>