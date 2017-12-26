<?php

namespace App\Observers;

use App\Models\Message;

class MessageObserver
{
    public function saved(Message $message)
    {
        $cacheKey = 'page_'.$page->id;
        Cache::forever($cacheKey,$page);
    }
}