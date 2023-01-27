<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
<head>
    <title>@yield('title')</title>

    <meta name="_token" content="{{csrf_token()}}">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <meta name="description" content="big-deal">
    <meta name="keywords" content="big-deal">
    <meta name="author" content="big-deal">

    <link rel="icon" href="{{asset('storage/app/public/company')}}/{{$web_config['web_logo']->value}}" type="image/x-icon">
    <link rel="shortcut icon" href="{{asset('storage/app/public/company')}}/{{$web_config['web_logo']->value}}" type="image/x-icon">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css">
    @stack('css_or_js')

    @php($google_tag_manager_id = \App\CPU\Helpers::get_business_settings('google_tag_manager_id'))
    @if($google_tag_manager_id )
        <!-- Google Tag Manager -->
            <script>(function (w, d, s, l, i) {
                    w[l] = w[l] || [];
                    w[l].push({
                        'gtm.start':
                            new Date().getTime(), event: 'gtm.js'
                    });
                    var f = d.getElementsByTagName(s)[0],
                        j = d.createElement(s), dl = l != 'dataLayer' ? '&l=' + l : '';
                    j.async = true;
                    j.src =
                        'https://www.googletagmanager.com/gtm.js?id=' + i + dl;
                    f.parentNode.insertBefore(j, f);
                })(window, document, 'script', 'dataLayer', '{{$google_tag_manager_id}}');</script>
            <!-- End Google Tag Manager -->

    @endif

    @php($pixel_analytices_user_code =\App\CPU\Helpers::get_business_settings('pixel_analytics'))
    @if($pixel_analytices_user_code)
        <!-- Facebook Pixel Code -->
            <script>
                !function (f, b, e, v, n, t, s) {
                    if (f.fbq) return;
                    n = f.fbq = function () {
                        n.callMethod ?
                            n.callMethod.apply(n, arguments) : n.queue.push(arguments)
                    };
                    if (!f._fbq) f._fbq = n;
                    n.push = n;
                    n.loaded = !0;
                    n.version = '2.0';
                    n.queue = [];
                    t = b.createElement(e);
                    t.async = !0;
                    t.src = v;
                    s = b.getElementsByTagName(e)[0];
                    s.parentNode.insertBefore(t, s)
                }(window, document, 'script',
                    'https://connect.facebook.net/en_US/fbevents.js');
                fbq('init', '{your-pixel-id-goes-here}');
                fbq('track', 'PageView');
            </script>
            <noscript>
                <img height="1" width="1" style="display:none"
                    src="https://www.facebook.com/tr?id={your-pixel-id-goes-here}&ev=PageView&noscript=1"/>
            </noscript>
            <!-- End Facebook Pixel Code -->
    @endif

    <script async src="https://www.googletagmanager.com/gtag/js?id=G-928K0YRN83"></script>
    <script>
        window.dataLayer = window.dataLayer || [];

        function gtag() {
            dataLayer.push(arguments);
        }

        gtag('js', new Date());

        gtag('config', 'G-928K0YRN83');
    </script>

    <!--Google font-->
    <link href="https://fonts.googleapis.com/css?family=PT+Sans:400,700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Raleway&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Aclonica&display=swap" rel="stylesheet">
    <link
        href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap"
        rel="stylesheet">
    <link
        href="https://fonts.googleapis.com/css2?family=Rubik:ital,wght@0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
        rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Days+One&display=swap" rel="stylesheet">
    <link
        href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
        rel="stylesheet">

    <!--icon css-->
    <link rel="stylesheet" type="text/css" href="{{asset("public/assets/css/font-awesome.css")}}">
    <link rel="stylesheet" type="text/css" href="{{asset("public/assets/css/themify.css")}}">

    <!--Slick slider css-->
    <link rel="stylesheet" type="text/css" href="{{asset("public/assets/css/slick.css")}}">
    <link rel="stylesheet" type="text/css" href="{{asset("public/assets/css/slick-theme.css")}}">

    <!--Animate css-->
    <link rel="stylesheet" type="text/css" href="{{asset("public/assets/css/animate.css")}}">
    <!-- Bootstrap css -->
    <link rel="stylesheet" type="text/css" href="{{asset("public/assets/css/bootstrap.css")}}">

    <!-- Theme css -->
    <link rel="stylesheet" type="text/css" href="{{asset("public/assets/css/color11.css")}}" media="screen">

    <style>
        @media (min-width: 1200px) {
            .pixelstrap ul {
                width: 300px !important
            }
            .category-left {
                width: 300px
            }
            .category-left .header-category .category-toggle {
                text-align: center
            }
            .rtl #main-menu{
            display: flex;
            flex-direction: row-reverse;
            }
        }
        @media (min-width: 992px) {
            .header7 .header-contain .logo-block .brand-logo img {
            height: 50px !important;
            width: auto;
            }
        }

        .twitter-typeahead {

            transition:all 1s ease;
        }
        input[type="search"]:focus {
            border:1px solid #0d6efd !important;
        }
        .header7 .header-contain .icon-block ul li svg {
            width: 25px !important;
            font-size:25px;
            color: #fff;
            }

        .rtl .brand-logo img {
            -webkit-transform: scaleX(1) !important;
            transform: scaleX(1) !important;
        }
        .rtl .ul{
            right: 100%;
        }
    .Sublink{
    background: aliceblue;
    font-size: 18px;
    width: 100%;
    flex-direction: column;
    transition: all 1s;
    display: none;
    }
    .li{
    color: #000;
    font-weight: bold;
    width: 100%;
    display: flex !important;
    justify-content: unset;
    padding: 1px 15px;
    margin: 5px;
    }
    .hides{display:flex !important;}
    </style>
</head>
<body class="bg-light">
{{--<img src="{{asset('storage/app/public/company')}}/{{$web_config['web_logo']->value}}">--}}

{{--@php($company_logo = \App\Model\BusinessSetting::where('type', 'company_web_logo')->first())--}}

@if($google_tag_manager_id)
    <!-- Google Tag Manager (noscript) -->
    <noscript>
        <iframe src="https://www.googletagmanager.com/ns.html?id={{$google_tag_manager_id}}"
                height="0" width="0" style="display:none;visibility:hidden">
        </iframe>
    </noscript>
    <!-- End Google Tag Manager (noscript) -->
@endif

@php($cart=\App\CPU\CartManager::get_cart())

<!-- loader start -->
<div class="loader-wrapper">
    <div>
        <img src="{{ asset('public/app/public/company') . '/' . $web_config['web_logo']->value }}"
        width="200px"
        onerror="this.src='{{asset('public/assets/front-end/img/loader.gif')}}'" alt="loader">
    </div>
</div>
<!-- loader end -->

<!--header start-->
<header id="stickyheader" class="header-style2">
    <div class="mobile-fix-option"></div>
    <div class="top-header2">
        <div class="container">
            <div class="row">
                <div class="col-lg-8 col-md-6 col-sm-12">
                    <div class="top-header-left">
                        <ul>
                            <li><a href="javascript:void(0)"><i class="fa fa-phone"></i>Call Us:
                                {{ $web_config['phone']->value }}</a>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 col-sm-12">
                    <div class="top-header-right">
                        <ul>
                            <li>
                                <a href="{{ auth('customer')->check() ? route('wishlists') : route('customer.auth.login') }}">
                                    <i class="fa fa-heart"></i>
                                    {{ \App\CPU\translate('My Wishlists') }}
                                </a>
                            </li>
                            <li>
                                <a href="{{ auth('customer')->check() ? route('user-account') : route('customer.auth.login') }}">
                                    <i class="fa fa-user"></i>
                                    {{ \App\CPU\translate('my_profile') }}
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="header7">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="header-contain">
                        <div class="logo-block">
                            <div class="mobilecat-toggle"><i class="fa fa-bars sidebar-bar"></i></div>
                            <div class="brand-logo logo-sm-center"><a href="{{ route('home') }}"> <img
                                        src="{{ asset('public/app/public/company') . '/' . $web_config['web_logo']->value }}"
                                        class="img-fluid  " alt="logo">
                                </a>
                            </div>
                        </div>
                        <div class="header-search ajax-search the-basics">
                            <form action="{{ route('products') }}" type="submit">
                                <div class="input-group">
                                    <input type="search" style="border-radius: 50px !important;" class="form-control typeahead" placeholder="{{ \App\CPU\translate('search') }}...">
                                    <input type="hidden" name="data_from" value="search">
                                    <button type="submit" class="input-group-text">
                                        <i class="fa fa-search"></i>
                                    </button>
                                </div>
                            </form>
                        </div>
                        <div class="icon-block">
                            <ul class="theme-color">
                                <li class="mobile-search icon-md-block">
                                    <svg enable-background="new 0 0 512.002 512.002"
                                         viewBox="0 0 512.002 512.002" xmlns="http://www.w3.org/2000/svg">
                                    <g>
                                    <path d="m495.594
                                    416.408-134.086-134.095c14.685-27.49 22.492-58.333 22.492-90.312
                                    0-50.518-19.461-98.217-54.8-134.31-35.283-36.036-82.45-56.505-132.808-57.636-1.46-.033-2.92-.054-4.392-.054-105.869
                                    0-192 86.131-192 192s86.131 192 192 192c1.459 0 2.93-.021 4.377-.054
                                    30.456-.68 59.739-8.444 85.936-22.436l134.085 134.075c10.57 10.584 24.634
                                    16.414 39.601 16.414s29.031-5.83 39.589-16.403c10.584-10.577 16.413-24.639
                                    16.413-39.597s-5.827-29.019-16.407-39.592zm-299.932-64.453c-1.211.027-2.441.046-3.662.046-88.224
                                    0-160-71.776-160-160s71.776-160 160-160c1.229 0 2.449.019 3.671.046 86.2 1.935
                                    156.329 73.69 156.329 159.954 0 86.274-70.133 158.029-156.338 159.954z"/>
                                            <path d="m192 320.001c-70.58 0-128-57.42-128-128s57.42-128 128-128 128 57.42 128
                                    128-57.42 128-128 128z"/>
                                    </g>
                                    </svg>
                                </li>
                                <li class="mobile-user icon-desk-none" onclick="location.href='{{ auth('customer')->check() ? route('user-account') : route('customer.auth.login') }}'">
                                    <i class="fa-solid fa-user"></i>
                                </li>
                                <li class="mobile-setting " onclick="openSetting()">
                                    <i class="fa-solid fa-gear"></i>
                                </li>
                                <li class="mobile-wishlist item-count icon-desk-none" onclick="location.href='{{ route('wishlists') }}'">
                                    <i class="fa-solid fa-heart"></i>
                                </li>
                                <li class="mobile-cart item-count" onclick="openCart()">
                                    <i class="fa-solid fa-bag-shopping"></i>
                                    <div class="item-count-contain inverce"> {{ $cart->count() }}</div>
                                </li>
                                <li class="mobile-cart item-count" >
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"><path d="M15 12c0 1.654-1.346 3-3 3s-3-1.346-3-3 1.346-3 3-3 3 1.346 3 3zm9-.449s-4.252 8.449-11.985 8.449c-7.18 0-12.015-8.449-12.015-8.449s4.446-7.551 12.015-7.551c7.694 0 11.985 7.551 11.985 7.551zm-7 .449c0-2.757-2.243-5-5-5s-5 2.243-5 5 2.243 5 5 5 5-2.243 5-5z"/></svg>
                                    <div class="item-count-contain inverce" style="width: 75%;"> {{\App\Model\Traffic::count()}}</div>
                                </li>

                            @if(auth('customer')->check())
                                    <li class="mobile-cart item-count" >
                                        <a href="{{ auth('customer')->check() ? route('user-account') : route('customer.auth.login') }}">
                                            <i class="fa fa-user"></i>

                                        </a>
                                    </li>
                                @endif
                        </ul>
                            <div class="toggle-nav"><i class="fa fa-bars sidebar-bar"></i></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="searchbar-input">
            <div class="input-group">
                <div class="input-group-append">
               <span class="input-group-text">
                  <svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"
                       x="0px" y="0px" width="28.931px" height="28.932px" viewBox="0 0 28.931 28.932"
                       style="enable-background:new 0 0 28.931 28.932;" xml:space="preserve">
                     <g>
                        <path
                            d="M28.344,25.518l-6.114-6.115c1.486-2.067,2.303-4.537,2.303-7.137c0-3.275-1.275-6.355-3.594-8.672C18.625,1.278,15.543,0,12.266,0C8.99,0,5.909,1.275,3.593,3.594C1.277,5.909,0.001,8.99,0.001,12.266c0,3.276,1.275,6.356,3.592,8.674c2.316,2.316,5.396,3.594,8.673,3.594c2.599,0,5.067-0.813,7.136-2.303l6.114,6.115c0.392,0.391,0.902,0.586,1.414,0.586c0.513,0,1.024-0.195,1.414-0.586C29.125,27.564,29.125,26.299,28.344,25.518z M6.422,18.111c-1.562-1.562-2.421-3.639-2.421-5.846S4.86,7.983,6.422,6.421c1.561-1.562,3.636-2.422,5.844-2.422s4.284,0.86,5.845,2.422c1.562,1.562,2.422,3.638,2.422,5.845s-0.859,4.283-2.422,5.846c-1.562,1.562-3.636,2.42-5.845,2.42S7.981,19.672,6.422,18.111z"/>
                     </g>
                  </svg>
               </span>
                </div>
                <input type="text" class="form-control" placeholder="{{ \App\CPU\translate('search') }}...">
                <div class="input-group-append">
               <span class="input-group-text close-searchbar">
                  <svg viewBox="0 0 329.26933 329" xmlns="http://www.w3.org/2000/svg">
                     <path
                         d="m194.800781 164.769531 128.210938-128.214843c8.34375-8.339844 8.34375-21.824219 0-30.164063-8.339844-8.339844-21.824219-8.339844-30.164063 0l-128.214844 128.214844-128.210937-128.214844c-8.34375-8.339844-21.824219-8.339844-30.164063 0-8.34375 8.339844-8.34375 21.824219 0 30.164063l128.210938 128.214843-128.210938 128.214844c-8.34375 8.339844-8.34375 21.824219 0 30.164063 4.15625 4.160156 9.621094 6.25 15.082032 6.25 5.460937 0 10.921875-2.089844 15.082031-6.25l128.210937-128.214844 128.214844 128.214844c4.160156 4.160156 9.621094 6.25 15.082032 6.25 5.460937 0 10.921874-2.089844 15.082031-6.25 8.34375-8.339844 8.34375-21.824219 0-30.164063zm0 0"/>
                  </svg>
               </span>
                </div>
            </div>
        </div>
    </div>
    <div class="category-header7">
        <div class="container-fluid">
            <div class="row">
                <div class="col-12">
                    <div class="category-contain">
                        <div class="category-left">
                            {{-- @if(!isset($cat_exist)) --}}
                                <div class="header-category">
                                    <a class="category-toggle"><i
                                            class="fa fa-bars"></i>{{ \App\CPU\translate('categories') }}</a>
                                    <ul class="collapse-category show" style="height: 29rem; overflow: auto; display:none;">
                                        <li class="back-btn"><i class="fa fa-angle-left"></i>back</li>
                                        @php($home_categories = \App\Model\Category::where('home_status', true)->priority()->get())
                                        @foreach($home_categories as $cat)
                                            <li class="lis">
                                                <a href="{{route('products',['id'=> $cat['id'],'data_from'=>'category','page'=>1])}}"class="a">
                                                    <img
                                                        src="{{ asset('public/app/public/category') . '/' . $cat['icon'] }}"
                                                        width="39" height="39"
                                                        alt="">
                                                    {{ \Illuminate\Support\Str::limit($cat['name'], 20) }}
                                                </a>
                                                <ul class="Sublink">
                                                    @foreach($cat['childes'] as $subCategory)
                                                        <li class="li" id="li">
                                                            <a href="{{route('products',['id'=> $subCategory['id'],'data_from'=>'category','page'=>1])}}">{{$subCategory['name']}}</a>
                                                        </li>
                                                        @endforeach
                                                </ul>
                                            </li>
                                        @endforeach
                                        <li>
                                            <a href="{{ route('categories') }}">
                                                {{ \App\CPU\translate('view_all') }}
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                            {{-- @endif --}}
                            <div class="logo-block">
                                <div class="mobilecat-toggle "><i class="fa fa-bars sidebar-bar"></i></div>
                                <div class="brand-logo logo-sm-center">
                                    <a href="{{ route('home') }}">
                                        <img src="{{ asset('public/app/public/company') . '/' . $web_config['web_logo']->value }}"
                                             class="img-fluid  " alt="logo">
                                    </a>
                                </div>
                            </div>
                        </div>
                        <div class="category-right">
                            <div class="menu-block">
                                <nav id="main-nav">
                                    <div class="toggle-nav"><i class="fa fa-bars sidebar-bar"></i></div>
                                    <ul id="main-menu" class="sm pixelstrap sm-horizontal">
                                        <li>
                                            <div class="mobile-back text-right">Back<i class="fa fa-angle-right ps-2"
                                                                                       aria-hidden="true"></i></div>
                                        </li>
                                        <!--HOME-->
                                        <li>
                                            <a class="dark-menu-item"
                                               href="{{ route('home') }}">{{ \App\CPU\translate('HOME')}}</a>
                                        </li>
                                        <!--HOME-END-->
                                        <!--SHOP-->
                                        <li>
                                            <a class="dark-menu-item"
                                               href="javascript:void(0)">{{ \App\CPU\translate('brand')}}</a>
                                            <ul>
                                                @php($brands = \App\Model\Brand::active()->take(15)->get())
                                                @foreach($brands as $brand)
                                                    <li><a href="{{route('products',['id'=> $brand['id'],'data_from'=>'brand','page'=>1])}}">{{ $brand['name'] }}</a></li>
                                                @endforeach
                                            </ul>
                                        </li>
                                        <!--SHOP-END-->
                                        <!--product-meu end-->

                                        <!--product-meu start-->
                                        <li class="mega">
                                            <a class="dark-menu-item"
                                               href="{{ route('services') }}?data_from=latest">{{ \App\CPU\translate('Service')}}</a>
                                        </li>
                                        <!--product-meu end-->

                                        <!--product-meu start-->
                                        <li class="mega">
                                            <a class="dark-menu-item"
                                               href="{{ route('sellers') }}">{{ \App\CPU\translate('Sellers')}}</a>
                                        </li>
                                        <!--product-meu end-->

                                        <!--create account start-->
                                        <li>
                                            <a class="dark-menu-item"
                                               href="javascript:void(0)">{{ \App\CPU\translate('Create Account')}}</a>
                                            <ul>
                                                <li><a href="{{ route('shop.apply') }}">{{ \App\CPU\translate('Seller Sign Up')}}</a></li>
                                                <li><a href="{{ route('customer.auth.sign-up') }}">{{ \App\CPU\translate('customer Sign Up')}}</a></li>
                                            </ul>
                                        </li>
                                        <!--mega-meu end-->

                                        <!--pages meu start-->
                                        <li>
                                            <a class="dark-menu-item"
                                               href="javascript:void(0)">{{ \App\CPU\translate('login')}}</a>
                                            <ul>
                                                <li><a href="{{ route('seller.auth.login') }}">{{ \App\CPU\translate('seller_login')}}</a></li>
                                                <li><a href="{{ route('customer.auth.login') }}">{{ \App\CPU\translate('customer Sign In')}}</a></li>
                                            </ul>
                                        </li>
                                        <!--product-end end-->
                                    </ul>
                                </nav>
                            </div>
                        </div>
                        <div class="icon-block">
                            <ul class="theme-color">
                                <li class="mobile-search icon-md-block">
                                    <svg version="1.1" xmlns="http://www.w3.org/2000/svg"
                                         xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
                                         viewBox="0 0 612.01 612.01" style="enable-background:new 0 0 612.01 612.01;"
                                         xml:space="preserve">
                          <g>
                              <g id="_x34__4_">
                                  <g>
                                      <path d="M606.209,578.714L448.198,423.228C489.576,378.272,515,318.817,515,253.393C514.98,113.439,399.704,0,257.493,0
                                  C115.282,0,0.006,113.439,0.006,253.393s115.276,253.393,257.487,253.393c61.445,0,117.801-21.253,162.068-56.586
                                  l158.624,156.099c7.729,7.614,20.277,7.614,28.006,0C613.938,598.686,613.938,586.328,606.209,578.714z M257.493,467.8
                                  c-120.326,0-217.869-95.993-217.869-214.407S137.167,38.986,257.493,38.986c120.327,0,217.869,95.993,217.869,214.407
                                  S377.82,467.8,257.493,467.8z"/>
                                  </g>
                              </g>
                          </g>
                        </svg>
                                </li>
                                <li class="mobile-user icon-desk-none" onclick="location.href='{{ auth('customer')->check() ? route('user-account') : route('customer.auth.login') }}'">
                                    <svg version="1.1" xmlns="http://www.w3.org/2000/svg"
                                         xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
                                         viewBox="0 0 480 480" style="enable-background:new 0 0 480 480;"
                                         xml:space="preserve">
                            <g>
                                <g>
                                    <path d="M386.816,323.456l-69.984-14.016c-7.424-1.472-12.832-8.064-12.832-15.68v-16.064c4.608-6.4,8.928-14.944,13.408-23.872
                                c3.424-6.752,8.576-16.928,10.88-19.328c13.568-13.28,28.032-29.76,32.448-51.232c4-19.456,0-29.568-4.64-37.568
                                c0-15.648,0-44.288-5.44-64.928c-0.544-24.928-5.12-39.008-16.608-51.552c-8.128-8.768-20.096-10.816-29.696-12.448
                                c-3.808-0.64-9.024-1.536-10.848-2.528C276.896,5.056,260.032,0.512,239.392,0c-42.24,1.6-94.08,28.384-111.424,76.544
                                c-5.28,14.624-4.768,38.624-4.384,57.92l-0.448,11.232c-4.064,8-8.064,18.112-4.032,37.536
                                c4.416,21.568,18.88,38.016,32.384,51.232c2.336,2.432,7.552,12.672,11.008,19.424c4.544,8.896,8.896,17.44,13.504,23.84v16.032
                                c0,7.616-5.408,14.208-12.864,15.68l-69.984,14.016C48.448,332.384,16,371.968,16,417.568V448c0,17.632,14.368,32,32,32h384
                                c17.632,0,32-14.368,32-32v-30.432C464,371.968,431.552,332.384,386.816,323.456z M432,448H48v-30.432
                                c0-30.4,21.632-56.8,51.456-62.752l69.952-14.016C191.776,336.384,208,316.576,208,293.76V272c0-4.288-1.728-8.416-4.768-11.392
                                c-2.752-2.688-8.672-14.336-12.224-21.28c-6.016-11.776-11.2-21.952-17.12-27.712c-10.624-10.368-20.768-21.76-23.456-34.816
                                c-2.08-10.112-0.64-12.96,1.216-16.576c1.632-3.2,4.064-8,4.064-14.528l-0.16-11.872c-0.288-13.984-0.768-37.408,2.496-46.432
                                C170.464,52.96,209.856,33.152,239.584,32c14.656,0.384,26.176,3.424,38.4,10.24c6.592,3.648,14.272,4.928,21.024,6.08
                                c3.808,0.64,10.176,1.728,11.488,2.56c4.32,4.704,7.904,10.368,8.16,32.384c0,1.44,0.224,2.88,0.64,4.288
                                c4.768,16.352,4.768,44.576,4.768,58.144c0,6.528,2.464,11.328,4.064,14.528c1.856,3.616,3.296,6.464,1.216,16.608
                                c-2.656,12.992-12.864,24.416-23.456,34.784c-5.952,5.824-11.104,16-17.056,27.808c-3.456,6.912-9.312,18.496-12.032,21.152
                                c-3.072,3.008-4.8,7.136-4.8,11.424v21.76c0,22.816,16.224,42.624,38.592,47.072l69.984,14.016
                                c29.792,5.92,51.424,32.32,51.424,62.72V448z"/>
                                </g>
                            </g>
                        </svg>
                                </li>
                                <li class="mobile-setting " onclick="openSetting()">
                                    <i class="fa-solid fa-gear"></i>
                                </li>
                                <li class="mobile-wishlist item-count icon-desk-none" onclick="location.href='{{ route('wishlists') }}'">
                                    <svg version="1.1" xmlns="http://www.w3.org/2000/svg"
                                         xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
                                         viewBox="0 0 512 512" style="enable-background:new 0 0 512 512;"
                                         xml:space="preserve">
                          <g>
                              <g>
                                  <path d="M474.644,74.27C449.391,45.616,414.358,29.836,376,29.836c-53.948,0-88.103,32.22-107.255,59.25
                                c-4.969,7.014-9.196,14.047-12.745,20.665c-3.549-6.618-7.775-13.651-12.745-20.665c-19.152-27.03-53.307-59.25-107.255-59.25
                                c-38.358,0-73.391,15.781-98.645,44.435C13.267,101.605,0,138.213,0,177.351c0,42.603,16.633,82.228,52.345,124.7
                                c31.917,37.96,77.834,77.088,131.005,122.397c19.813,16.884,40.302,34.344,62.115,53.429l0.655,0.574
                                c2.828,2.476,6.354,3.713,9.88,3.713s7.052-1.238,9.88-3.713l0.655-0.574c21.813-19.085,42.302-36.544,62.118-53.431
                                c53.168-45.306,99.085-84.434,131.002-122.395C495.367,259.578,512,219.954,512,177.351
                                C512,138.213,498.733,101.605,474.644,74.27z M309.193,401.614c-17.08,14.554-34.658,29.533-53.193,45.646
                                c-18.534-16.111-36.113-31.091-53.196-45.648C98.745,312.939,30,254.358,30,177.351c0-31.83,10.605-61.394,29.862-83.245
                                C79.34,72.007,106.379,59.836,136,59.836c41.129,0,67.716,25.338,82.776,46.594c13.509,19.064,20.558,38.282,22.962,45.659
                                c2.011,6.175,7.768,10.354,14.262,10.354c6.494,0,12.251-4.179,14.262-10.354c2.404-7.377,9.453-26.595,22.962-45.66
                                c15.06-21.255,41.647-46.593,82.776-46.593c29.621,0,56.66,12.171,76.137,34.27C471.395,115.957,482,145.521,482,177.351
                                C482,254.358,413.255,312.939,309.193,401.614z"/>
                              </g>
                          </g>
                          </svg>
                                </li>
                                <li class="mobile-cart item-count" onclick="openCart()">
                                    <i class="fa-solid fa-bag-shopping"></i>
                                    <div class="item-count-contain inverce"> {{ $cart->count() }}</div>
                                </li>
                            </ul>
                            <div class="toggle-nav"><i class="fa fa-bars sidebar-bar"></i></div>
                        </div>
                        <div></div>
                    </div>
                </div>
            </div>
        </div>
        <form action="{{ route('products') }}" class="searchbar-input ajax-search the-basics">
            <input type="hidden" name="data_from" value="search">
            <div class="input-group">
               <button type="submit" class="input-group-text">
                  <svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" width="28.931px" height="28.932px" viewBox="0 0 28.931 28.932" style="enable-background:new 0 0 28.931 28.932;" xml:space="preserve">
                     <g>
                        <path
                            d="M28.344,25.518l-6.114-6.115c1.486-2.067,2.303-4.537,2.303-7.137c0-3.275-1.275-6.355-3.594-8.672C18.625,1.278,15.543,0,12.266,0C8.99,0,5.909,1.275,3.593,3.594C1.277,5.909,0.001,8.99,0.001,12.266c0,3.276,1.275,6.356,3.592,8.674c2.316,2.316,5.396,3.594,8.673,3.594c2.599,0,5.067-0.813,7.136-2.303l6.114,6.115c0.392,0.391,0.902,0.586,1.414,0.586c0.513,0,1.024-0.195,1.414-0.586C29.125,27.564,29.125,26.299,28.344,25.518z M6.422,18.111c-1.562-1.562-2.421-3.639-2.421-5.846S4.86,7.983,6.422,6.421c1.561-1.562,3.636-2.422,5.844-2.422s4.284,0.86,5.845,2.422c1.562,1.562,2.422,3.638,2.422,5.845s-0.859,4.283-2.422,5.846c-1.562,1.562-3.636,2.42-5.845,2.42S7.981,19.672,6.422,18.111z"/>
                     </g>
                  </svg>
               </button>
                <input type="search" class="form-control typeahead" placeholder="{{ \App\CPU\translate('search') }}...">
                <span class="input-group-text close-searchbar">
                    <svg viewBox="0 0 329.26933 329" xmlns="http://www.w3.org/2000/svg">
                       <path
                           d="m194.800781 164.769531 128.210938-128.214843c8.34375-8.339844 8.34375-21.824219 0-30.164063-8.339844-8.339844-21.824219-8.339844-30.164063 0l-128.214844 128.214844-128.210937-128.214844c-8.34375-8.339844-21.824219-8.339844-30.164063 0-8.34375 8.339844-8.34375 21.824219 0 30.164063l128.210938 128.214843-128.210938 128.214844c-8.34375 8.339844-8.34375 21.824219 0 30.164063 4.15625 4.160156 9.621094 6.25 15.082032 6.25 5.460937 0 10.921875-2.089844 15.082031-6.25l128.210937-128.214844 128.214844 128.214844c4.160156 4.160156 9.621094 6.25 15.082032 6.25 5.460937 0 10.921874-2.089844 15.082031-6.25 8.34375-8.339844 8.34375-21.824219 0-30.164063zm0 0"/>
                    </svg>
                </span>
            </div>
        </form>
    </div>
</header>
<!--header end-->

<!-- Sign in / sign up modal-->
@include('layouts.front-end.partials._modals')
<!-- Navbar-->
<!-- Quick View Modal-->
@include('layouts.front-end.partials._quick-view-modal')
<!-- Navbar Electronics Store-->
{{--@include('layouts.front-end.partials._header')--}}
<!-- Page title-->


{{--<div id="main_content">--}}
    <!-- Page Content-->
    @yield('content')
{{--</div>--}}

@yield('modal')

@if(!isset($cat_exist))
    <!-- Footer-->
    @include('layouts.front-end.partials._footer')
    <!-- Footer-->
@endif

<script src="{{asset('public/assets/front-end')}}/vendor/jquery/dist/jquery-2.2.4.min.js"></script>

<!-- latest jquery-->
<script src="{{asset("public/assets/js/jquery-3.3.1.min.js")}}"></script>

<!-- slick js-->
<script src="{{asset("public/assets/js/slick.js")}}"></script>


<!-- tool tip js -->
<script src="{{asset("public/assets/js/tippy-popper.min.js")}}"></script>
<script src="{{asset("public/assets/js/tippy-bundle.iife.min.js")}}"></script>

<!-- popper js-->
<script src="{{asset("public/assets/js/popper.min.js")}}"></script>

<!-- ajax search js -->
<script src="{{asset("public/assets/js/typeahead.bundle.min.js")}}"></script>
<script src="{{asset("public/assets/js/typeahead.jquery.min.js")}}"></script>
<script src="{{asset("public/assets/js/ajax-custom.js")}}"></script>

<!-- Timer js-->
<script src="{{asset("public/assets/js/menu.js")}}"></script>

<!-- Bootstrap js-->
<script src="{{asset("public/assets/js/bootstrap.js")}}"></script>

<!-- father icon -->
<script src="{{asset("public/assets/js/feather.min.js")}}"></script>
<script src="{{asset("public/assets/js/feather-icon.js")}}"></script>

<!-- Bootstrap js-->
<script src="{{asset("public/assets/js/bootstrap-notify.min.js")}}"></script>

<!-- Theme js-->
<script src="{{asset("public/assets/js/script.js")}}"></script>

<script>

    if(localStorage.getItem("layout") == "dark") {
        console.log(document.querySelector('.img_footer').src)
        document.querySelector('.img_footer').src = "{{ asset('public/app/public/company') . '/' . $web_config['footer_logo']->value }}"
    }

    var body_event = $("body");

    body_event.on("click", ".theme-layout-version" , function(){
    if($('.theme-layout-version').hasClass('dark')){
        document.querySelector('.img_footer').src = "{{ asset('public/app/public/company') . '/' . $web_config['footer_logo']->value }}"
    }else{
        document.querySelector('.img_footer').src = "{{ asset('public/app/public/company') . '/' . $web_config['web_logo']->value }}"
    }
    return false;
  });
</script>

{{--<script src="{{asset("public/assets/js/timer1.js")}}"></script>--}}
{{--<script src="{{asset("public/assets/js/timer2.js")}}"></script>--}}
<script src="{{asset("public/assets/js/modal.js")}}"></script>
{{--Toastr--}}
<script src={{asset("public/assets/back-end/js/toastr.js")}}></script>

{!! Toastr::message() !!}

<script src="{{asset('public/assets/front-end')}}/vendor/jquery/dist/jquery-2.2.4.min.js"></script>
<script src="{{asset('public/assets/front-end')}}/vendor/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
<script
    src="{{asset('public/assets/front-end')}}/vendor/bs-custom-file-input/dist/bs-custom-file-input.min.js"></script>
<script src="{{asset('public/assets/front-end')}}/vendor/simplebar/dist/simplebar.min.js"></script>
<script src="{{asset('public/assets/front-end')}}/vendor/tiny-slider/dist/min/tiny-slider.js"></script>
<script src="{{asset('public/assets/front-end')}}/vendor/smooth-scroll/dist/smooth-scroll.polyfills.min.js"></script>

{{-- light box --}}
<script src="{{asset('public/js/lightbox.min.js')}}"></script>
<script src="{{asset('public/assets/front-end')}}/vendor/drift-zoom/dist/Drift.min.js"></script>
<script src="{{asset('public/assets/front-end')}}/vendor/lightgallery.js/dist/js/lightgallery.min.js"></script>
<script src="{{asset('public/assets/front-end')}}/vendor/lg-video.js/dist/lg-video.min.js"></script>
{{--Toastr--}}
<script src={{asset("public/assets/back-end/js/toastr.js")}}></script>
<!-- Main theme script-->
<script src="{{asset('public/assets/front-end')}}/js/theme.min.js"></script>
<script src="{{asset('public/assets/front-end')}}/js/slick.min.js"></script>

<script src="{{asset('public/assets/front-end')}}/js/sweet_alert.js"></script>

<script>
    function addWishlist(product_id) {
        $.ajaxSetup({
            headers: {
                'X-CSRF-TOKEN': $('meta[name="_token"]').attr('content')
            }
        });
        $.ajax({
            url: "{{route('store-wishlist')}}",
            method: 'POST',
            data: {
                product_id: product_id
            },
            success: function (data) {
                if (data.value == 1) {
                    Swal.fire({
                        position: 'top-end',
                        type: 'success',
                        title: data.success,
                        showConfirmButton: false,
                        timer: 1500
                    });
                    $('.countWishlist').html(data.count);
                    $('.countWishlist-' + product_id).text(data.product_count);
                    $('.tooltip').html('');

                } else if (data.value == 2) {
                    Swal.fire({
                        type: 'info',
                        title: 'WishList',
                        text: data.error
                    });
                } else {
                    Swal.fire({
                        type: 'error',
                        title: 'WishList',
                        text: data.error
                    });
                }
            }
        });
    }

    function removeWishlist(product_id) {
        $.ajaxSetup({
            headers: {
                'X-CSRF-TOKEN': $('meta[name="_token"]').attr('content')
            }
        });
        $.ajax({
            url: "{{route('delete-wishlist')}}",
            method: 'POST',
            data: {
                id: product_id
            },
            beforeSend: function () {
                $('#loading').show();
            },
            success: function (data) {
                Swal.fire({
                    type: 'success',
                    title: 'WishList',
                    text: data.success
                });
                $('.countWishlist').html(data.count);
                $('#set-wish-list').html(data.wishlist);
                $('.tooltip').html('');
            },
            complete: function () {
                $('#loading').hide();
            },
        });
    }

    function quickView(product_id) {
        $.get({
            url: '{{route('quick-view')}}',
            dataType: 'json',
            data: {
                product_id: product_id
            },
            beforeSend: function () {
                $('#loading').show();
            },
            success: function (data) {
                console.log("success...")
                $('#quick-view').modal('show');
                $('#quick-view-modal').empty().html(data.view);
            },
            complete: function () {
                $('#loading').hide();
            },
        });
    }

    function addToCart(form_id = 'add-to-cart-form', redirect_to_checkout = false) {
        if (checkAddToCartValidity()) {
            $.ajaxSetup({
                headers: {
                    'X-CSRF-TOKEN': $('meta[name="_token"]').attr('content')
                }
            });
            $.post({
                url: '{{ route('cart.add') }}',
                data: $('#' + form_id).serializeArray(),
                beforeSend: function () {
                    $('#loading').show();
                },
                success: function (response) {
                    console.log(response);
                    if (response.status == 1) {
                        updateNavCart();
                        toastr.success(response.message, {
                            CloseButton: true,
                            ProgressBar: true
                        });
                        $('.call-when-done').click();
                        if (redirect_to_checkout) {
                            location.href = "{{route('checkout-details')}}";
                        }
                        return false;
                    } else if (response.status == 0) {
                        Swal.fire({
                            icon: 'error',
                            title: 'Cart',
                            text: response.message
                        });
                        return false;
                    }
                },
                complete: function () {
                    $('#loading').hide();

                }
            });
        } else {
            Swal.fire({
                type: 'info',
                title: 'Cart',
                text: '{{\App\CPU\translate('please_choose_all_the_options')}}'
            });
        }
    }

    function buy_now() {
        addToCart('add-to-cart-form', true);
        /* location.href = "{{route('checkout-details')}}"; */
    }

    function currency_change(currency_code) {
        $.ajaxSetup({
            headers: {
                'X-CSRF-TOKEN': $('meta[name="_token"]').attr('content')
            }
        });
        $.ajax({
            type: 'POST',
            url: '{{route('currency.change')}}',
            data: {
                currency_code: currency_code
            },
            success: function (data) {
                toastr.success('{{\App\CPU\translate('Currency changed to')}}' + data.name);
                location.reload();
            }
        });
    }

    function removeFromCart(key) {
        $.post('{{ route('cart.remove') }}', {_token: '{{ csrf_token() }}', key: key}, function (response) {
            console.log(response)
            updateNavCart();
            $('#cart-summary').empty().html(response.data);
            toastr.info('{{\App\CPU\translate('Item has been removed from cart')}}', {
                CloseButton: true,
                ProgressBar: true
            });
        });
    }

    function updateNavCart() {
        $.post('{{route('cart.nav-cart')}}', {_token: '{{csrf_token()}}'}, function (response) {
            $('#cart_items').html(response.data);
        });
    }

    function cartQuantityInitialize() {
        $('.btn-number').click(function (e) {
            e.preventDefault();

            fieldName = $(this).attr('data-field');
            type = $(this).attr('data-type');
            var input = $("input[name='" + fieldName + "']");
            var currentVal = parseInt(input.val());

            if (!isNaN(currentVal)) {
                if (type == 'minus') {

                    if (currentVal > input.attr('min')) {
                        input.val(currentVal - 1).change();
                    }
                    if (parseInt(input.val()) == input.attr('min')) {
                        $(this).attr('disabled', true);
                    }

                } else if (type == 'plus') {

                    if (currentVal < input.attr('max')) {
                        input.val(currentVal + 1).change();
                    }
                    if (parseInt(input.val()) == input.attr('max')) {
                        $(this).attr('disabled', true);
                    }

                }
            } else {
                input.val(0);
            }
        });

        $('.input-number').focusin(function () {
            $(this).data('oldValue', $(this).val());
        });

        $('.input-number').change(function () {

            minValue = parseInt($(this).attr('min'));
            maxValue = parseInt($(this).attr('max'));
            valueCurrent = parseInt($(this).val());

            var name = $(this).attr('name');
            if (valueCurrent >= minValue) {
                $(".btn-number[data-type='minus'][data-field='" + name + "']").removeAttr('disabled')
            } else {
                Swal.fire({
                    icon: 'error',
                    title: 'Cart',
                    text: '{{\App\CPU\translate('Sorry, the minimum order quantity does not match')}}'
                });
                $(this).val($(this).data('oldValue'));
            }
            if (valueCurrent <= maxValue) {
                $(".btn-number[data-type='plus'][data-field='" + name + "']").removeAttr('disabled')
            } else {
                Swal.fire({
                    icon: 'error',
                    title: 'Cart',
                    text: '{{\App\CPU\translate('Sorry, stock limit exceeded')}}.'
                });
                $(this).val($(this).data('oldValue'));
            }


        });
        $(".input-number").keydown(function (e) {
            // Allow: backspace, delete, tab, escape, enter and .
            if ($.inArray(e.keyCode, [46, 8, 9, 27, 13, 190]) !== -1 ||
                // Allow: Ctrl+A
                (e.keyCode == 65 && e.ctrlKey === true) ||
                // Allow: home, end, left, right
                (e.keyCode >= 35 && e.keyCode <= 39)) {
                // let it happen, don't do anything
                return;
            }
            // Ensure that it is a number and stop the keypress
            if ((e.shiftKey || (e.keyCode < 48 || e.keyCode > 57)) && (e.keyCode < 96 || e.keyCode > 105)) {
                e.preventDefault();
            }
        });
    }

    function updateQuantity(key, element) {
        $.post('<?php echo e(route('cart.updateQuantity')); ?>', {
            _token: '<?php echo e(csrf_token()); ?>',
            key: key,
            quantity: element[0].value
        }, function (data) {
            updateNavCart();
            $('#cart-summary').empty().html(data);
        });
    }

    function updateCartQuantity(minimum_order_qty, key) {
        /* var quantity = $("#cartQuantity" + key).children("option:selected").val(); */
        var quantity = $("#cartQuantity" + key).val();
        if (minimum_order_qty > quantity) {
            toastr.error('{{\App\CPU\translate("minimum_order_quantity_cannot_be_less_than_")}}' + minimum_order_qty);
            $("#cartQuantity" + key).val(minimum_order_qty);
            return false;
        }

        $.post('{{route('cart.updateQuantity')}}', {
            _token: '{{csrf_token()}}',
            key: key,
            quantity: quantity
        }, function (response) {
            if (response.status == 0) {
                toastr.error(response.message, {
                    CloseButton: true,
                    ProgressBar: true
                });
                $("#cartQuantity" + key).val(response['qty']);
            } else {
                updateNavCart();
                $('#cart-summary').empty().html(response);
            }
        });
    }

    $('#add-to-cart-form input').on('change', function () {
        getVariantPrice();
    });

    function getVariantPrice() {
        if ($('#add-to-cart-form input[name=quantity]').val() > 0 && checkAddToCartValidity()) {
            $.ajaxSetup({
                headers: {
                    'X-CSRF-TOKEN': $('meta[name="_token"]').attr('content')
                }
            });
            $.ajax({
                type: "POST",
                url: '{{ route('cart.variant_price') }}',
                data: $('#add-to-cart-form').serializeArray(),
                success: function (data) {
                    console.log(data)
                    $('#add-to-cart-form #chosen_price_div').removeClass('d-none');
                    $('#add-to-cart-form #chosen_price_div #chosen_price').html(data.price);
                    $('#set-tax-amount').html(data.tax);
                    $('#set-discount-amount').html(data.discount);
                    $('#available-quantity').html(data.quantity);
                    $('.cart-qty-field').attr('max', data.quantity);
                }
            });
        }
    }

    function checkAddToCartValidity() {
        var names = {};
        $('#add-to-cart-form input:radio').each(function () { // find unique names
            names[$(this).attr('name')] = true;
        });
        var count = 0;
        $.each(names, function () { // then count them
            count++;
        });
        if ($('input:radio:checked').length == count) {
            return true;
        }
        return false;
    }

    @if(Request::is('/') &&  \Illuminate\Support\Facades\Cookie::has('popup_banner')==false)
    $(document).ready(function () {
        $('#popup-modal').appendTo("body").modal('show');
    });
    @php(\Illuminate\Support\Facades\Cookie::queue('popup_banner', 'off', 1))
    @endif

    $(".clickable").click(function () {
        window.location = $(this).find("a").attr("href");
        return false;
    });
</script>

@if ($errors->any())
    <script>
        @foreach($errors->all() as $error)
        toastr.error('{{$error}}', Error, {
            CloseButton: true,
            ProgressBar: true
        });
        @endforeach
    </script>
@endif

<script>
    function couponCode() {
        $.ajaxSetup({
            headers: {
                'X-CSRF-TOKEN': $('meta[name="_token"]').attr('content')
            }
        });
        $.ajax({
            type: "POST",
            url: '{{ route('coupon.apply') }}',
            data: $('#coupon-code-ajax').serializeArray(),
            success: function (data) {
                /* console.log(data);
                return false; */
                if (data.status == 1) {
                    let ms = data.messages;
                    ms.forEach(
                        function (m, index) {
                            toastr.success(m, index, {
                                CloseButton: true,
                                ProgressBar: true
                            });
                        }
                    );
                } else {
                    let ms = data.messages;
                    ms.forEach(
                        function (m, index) {
                            toastr.error(m, index, {
                                CloseButton: true,
                                ProgressBar: true
                            });
                        }
                    );
                }
                setInterval(function () {
                    location.reload();
                }, 2000);
            }
        });
    }

    jQuery(".search-bar-input").keyup(function () {
        $(".search-card").css("display", "block");
        let name = $(".search-bar-input").val();
        if (name.length > 0) {
            $.get({
                url: '{{url('/')}}/searched-products',
                dataType: 'json',
                data: {
                    name: name
                },
                beforeSend: function () {
                    $('#loading').show();
                },
                success: function (data) {
                    $('.search-result-box').empty().html(data.result)
                },
                complete: function () {
                    $('#loading').hide();
                },
            });
        } else {
            $('.search-result-box').empty();
        }
    });

    jQuery(".search-bar-input-mobile").keyup(function () {
        $(".search-card").css("display", "block");
        let name = $(".search-bar-input-mobile").val();
        if (name.length > 0) {
            $.get({
                url: '{{url('/')}}/searched-products',
                dataType: 'json',
                data: {
                    name: name
                },
                beforeSend: function () {
                    $('#loading').show();
                },
                success: function (data) {
                    $('.search-result-box').empty().html(data.result)
                },
                complete: function () {
                    $('#loading').hide();
                },
            });
        } else {
            $('.search-result-box').empty();
        }
    });

    jQuery(document).mouseup(function (e) {
        var container = $(".search-card");
        if (!container.is(e.target) && container.has(e.target).length === 0) {
            container.hide();
        }
    });

    const img = document.getElementByTagName("img")


    function route_alert(route, message) {
        Swal.fire({
            title: '{{\App\CPU\translate('Are you sure')}}?',
            text: message,
            type: 'warning',
            showCancelButton: true,
            cancelButtonColor: 'default',
            confirmButtonColor: '{{$web_config['primary_color']}}',
            cancelButtonText: '{{\App\CPU\translate('No')}}',
            confirmButtonText: '{{\App\CPU\translate('Yes')}}',
            reverseButtons: true
        }).then((result) => {
            if (result.value) {
                location.href = route;
            }
        })
    }
</script>
<script>
let a = document.querySelectorAll(".a");
let ul = document.querySelectorAll(".Sublink");

a.forEach((link, i) => {

    link.addEventListener("mouseover", () => {
        ul[i].style.display = "flex"

    });
    link.addEventListener("mouseout",  () =>{
        ul[i].style.display = "none"

    });

})

</script>


<script src="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/js/all.min.js"></script>

@stack('script')
<script>
    $('.colors li').click(function(){
        let color = this.className.split(' ')[0]
        console.log(color)
        $('head').append('<link rel="stylesheet" type="text/css" href="{{asset("public/assets")}}/css/'+ color +'.css" media="screen" id="color">')
    })
</script>




</body>
</html>
