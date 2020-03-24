<?php

namespace Modules\Admin\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class AdminPostRequest extends FormRequest
{
    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [
            'p_name' => 'required|unique:posts,p_name,' . $this->id,
            'p_slug' => 'required|unique:posts,p_slug,' . $this->id,
            'p_title_seo' => 'required',
            'p_description_seo' => 'required',
        ];
    }

    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }
    public function messages()
    {
        return [
            'p_name.required' => 'Tên bài viết là trường bắt buộc',
            'p_name.unique' => 'Tên bài viết đã tồn tại',
            'p_slug.required' => 'Slug là trường bắt buộc',
            'p_slug.unique' => 'Slug đã tồn tại',
            'p_title_seo.required' => 'Title SEO là trường bắt buộc',
            'p_description_seo.required' => 'Description SEO là trường bắt buộc',

        ];
    }
}
