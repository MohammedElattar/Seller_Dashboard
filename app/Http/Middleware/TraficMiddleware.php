<?php

namespace App\Http\Middleware;

use App\CPU\Helpers;
use App\Model\Traffic;
use Brian2694\Toastr\Facades\Toastr;
use Closure;
use http\Client;
use Illuminate\Support\Facades\Request;
use Mpdf\Tag\Tr;

class TraficMiddleware
{
    /**
     * Handle an incoming request.
     *
     * @param \Illuminate\Http\Request $request
     * @param \Closure $next
     * @return mixed
     */
    public function handle($request, Closure $next)
    {
        $ip = Request::ip();
        $trafic_found = Traffic::where('ip', $ip)->first();
        if(empty($trafic_found)){
            $trafic = new Traffic;
            $trafic->ip = $ip;
            $trafic->save();
        }
        return $next($request);
    }
}
