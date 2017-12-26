<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;


class ProductCategory extends Model
{
    protected $table = 'product_categories';

    public function parentId()
    {
        return $this->belongsTo(self::class);
    }

//    public function products()
//    {
//        return $this->hasMany(Product::class)
//            ->orderBy('featured', 'DESC')
//            ->orderBy('updated_at','DESC');
//    }
}
