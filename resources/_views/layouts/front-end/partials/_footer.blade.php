<!-- footer start -->

<footer>
    <div class="footer1">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="footer-main">
                        <div class="footer-box">
                            <div class="footer-title mobile-title">
                                <h5>about</h5>
                            </div>
                            <div class="footer-contant">
                                <div class="footer-logo">
                                    <a href="{{ route('home') }}">
                                        <img
                                            src="{{ asset('app/public/company') . '/' . $web_config['web_logo']->value }}"
                                            class="img-fluid img_footer" alt="logo" style="width: 100%; height: 100%;">
                                    </a>
                                </div>
                            </div>
                        </div>
                        <div class="footer-box">
                            <div class="footer-title">
                                <h5>{{\App\CPU\translate('account_&_shipping_info')}}</h5>
                            </div>
                            <div class="footer-contant">
                                <ul>
                                    <li>
                                        <a href="@if(auth('customer')->check()) {{route('user-account')}} @else {{route('customer.auth.login')}} @endif">{{\App\CPU\translate('profile_info')}}</a>
                                    </li>
                                    <li>
                                        <a href="@if(auth('customer')->check()) {{route('wishlists')}} @else {{route('customer.auth.login')}} @endif">{{\App\CPU\translate('wish_list')}}</a>
                                    </li>
                                    <li>
                                        <a href="{{route('track-order.index')}}">{{\App\CPU\translate('track_order')}}</a>
                                    </li>
                                    <li>
                                        <a href="@if(auth('customer')->check()) {{route('account-address')}} @else {{route('customer.auth.login')}} @endif">{{\App\CPU\translate('address')}}</a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <div class="footer-box">
                            <div class="footer-title">
                                <h5>{{\App\CPU\translate('special')}}</h5>
                            </div>
                            <div class="footer-contant">
                                <ul class="contact-list">
                                    @php $flash_deals=\App\Model\FlashDeal::where(['status'=>1,'deal_type'=>'flash_deal'])->whereDate('start_date','<=',date('Y-m-d'))->whereDate('end_date','>=',date('Y-m-d'))->first() @endphp
                                    @if(isset($flash_deals))
                                        <li>
                                            <a class="widget-list-link"
                                               href="{{route('flash-deals',[$flash_deals['id']])}}">
                                                {{\App\CPU\translate('flash_deal')}}
                                            </a>
                                        </li>
                                    @endif
                                    <li><a href="{{route('products',['data_from'=>'featured','page'=>1])}}">{{\App\CPU\translate('featured_products')}}</a></li>
                                    <li><a href="{{route('products',['data_from'=>'latest','page'=>1])}}">{{\App\CPU\translate('latest_products')}}</a></li>
                                    <li><a href="{{route('products',['data_from'=>'best-selling','page'=>1])}}">{{\App\CPU\translate('best_selling_product')}}</a></li>
                                    <li><a href="{{route('products',['data_from'=>'top-rated','page'=>1])}}">{{\App\CPU\translate('top_rated_product')}}</a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="footer-box">
                            @php $ios = \App\CPU\Helpers::get_business_settings('download_app_apple_stroe') @endphp
                            @php $android = \App\CPU\Helpers::get_business_settings('download_app_google_stroe') @endphp

                            @if($ios['status'] || $android['status'])
                                <div class="footer-title">
                                    <h5>{{\App\CPU\translate('download_our_app')}}</h5>
                                </div>
                            @endif
                            <div class="footer-contant">
                                @if($ios['status'])
                                    <div class="{{Session::get('direction') === "rtl" ? 'ml-2' : 'mr-2'}} mb-2">
                                        <a class="" href="{{ $ios['link'] }}" role="button"><img
                                                src="{{asset("public/assets/front-end/png/apple_app.png")}}"
                                                alt="" style="height: 51px!important;">
                                        </a>
                                    </div>
                                @endif

                                @if($android['status'])
                                    <div class="{{Session::get('direction') === "rtl" ? 'ml-2' : 'mr-2'}} mb-2">
                                        <a href="{{ $android['link'] }}" role="button">
                                            <img src="{{asset("public/assets/front-end/png/google_app.png")}}"
                                                 alt="" style="height: 51px!important;">
                                        </a>
                                    </div>
                                @endif
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="subfooter dark-footer ">
        <div class="container">
            <div class="row">
                <div class="col-xl-4 col-md-8 col-sm-12">
                    <div class="footer-left">
                        <p>{{ $web_config['copyright_text']->value }}</p>
                    </div>
                </div>
                <div class="col-xl-4 col-md-4 col-sm-12" style="display: flex; justify-content: center;">
                    <div class="footer-right">
                        <ul class="sosiyal">
                            <li><a href="https://facebook.com"><i class="fa fa-facebook"></i></a></li>
                            <li><a href="https://dev.6amtech.com/"><i class="fa fa-google-plus"></i></a></li>
                            <li><a href="https://www.w3schools.com/howto/howto_css_table_responsive.asp"><i class="fa fa-twitter"></i></a></li>
                            <li><a href="https://dev.6amtech.com/"><i class="fa fa-instagram"></i></a></li>
                            <li><a href="https://dev.6amtech.com/"><i class="fa fa-linkedin"></i></a></li>
                            <li><a href="https://dev.6amtech.com/"><i class="fa fa-pinterest"></i></a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</footer>
<!-- footer end -->
