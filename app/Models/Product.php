<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Nicolaslopezj\Searchable\SearchableTrait;


class Product extends Model
{
//    use SearchableTrait;
//
//    protected $searchable = [
//        /**
//         * Columns and their priority in search results.
//         * Columns with higher values are more important.
//         * Columns with equal values have equal importance.
//         *
//         * @var array
//         */
//        'columns' => [
//            'name' => 10,
//            'seo_title' => 9,
//            'body' => 8,
//            'meta_description' => 7,
//            'meta_keywords' => 6,
//        ],
//    ];

    public function productCategory()
    {
        return $this->belongsTo(ProductCategory::class);
    }
}
