<?php

namespace App\Http\Controllers;

use App\Mail\OrderShipped;
use Illuminate\Http\Request;
use Mail;
use App\Models\Order;

class MailController extends Controller
{

    public function submit(Request $request)
    {
        $this->validate($request,[
            'name'=>'required',
            'email'=>'required|email',
        ]);

        $order = new Order();
        $order->name = $request->name;
        $order->email = $request->email;
        $order->phone =$request->phone;
        $order->subject =$request->subject;
        $order->message =$request->message;
        $order->url =$request->url;

        $order->save();
//        Mail::send('emails.mail',['form'=>$order], function ($order) {
//            $order->from('info@e.furnace-tech.com', 'webmaster');
//            $order->to(['chaos29092@gmail.com',]);
//            $order->subject('网站留言');
//        });

//        Mail::to('chaos29092@gmail.com')->queue(new OrderShipped($order));
        Mail::to('chaos29092@gmail.com')->send(new OrderShipped($order));

        return redirect('/submit_ok');
    }

    public function submit_ok()
    {
        return view('submit_ok');
    }

}
