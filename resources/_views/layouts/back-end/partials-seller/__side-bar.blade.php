<!-- sa-app__sidebar -->
<div class="sa-app__sidebar" style="text-align: {{ Session::get('direction') === 'rtl' ? 'right' : 'left' }};">
    <div class="sa-sidebar">
        <div class="sa-sidebar__header">
            <a class="sa-sidebar__logo" href="index.html">
                <!-- logo -->
                @php($shop = \App\Model\Shop::where(['seller_id' => auth('seller')->id()])->first())
                {{-- @can('ORDER MANAGEMENT') --}}
                <div class="sa-sidebar-logo">
                    <a class="navbar-brand" href="#" aria-label="Front">
                        @if (isset($shop))

                            {{-- Logo Is Too Big So Fix It  --}}
                            
                            {{-- <img onerror="this.src='{{ asset('public/assets/back-end/img/900x400/img1.jpg') }}'"
                                class="navbar-brand-logo-mini for-seller-logo"
                                src="{{ asset("storage/app/public/shop/$shop->image") }}" alt="Logo"> --}}
                        @else
                            <img class="navbar-brand-logo-mini for-seller-logo"
                                src="{{ asset('public/assets/back-end/img/900x400/img1.jpg') }}" alt="Logo">
                        @endif
                    </a>
                </div>
                <!-- Logo -->
                {{-- @endcan --}}
                <!-- logo / end -->
            </a>
        </div>
        <div class="sa-sidebar__body" data-simplebar="">
            <ul class="sa-nav sa-nav--sidebar" data-sa-collapse="">

                {{-- Start Dashboards --}}
                <li class="sa-nav__section">
                    <div class="sa-nav__section-title">
                        <span>{{ \App\CPU\translate('Dashboard') }}</span>
                    </div>
                    <ul class="sa-nav__menu sa-nav__menu--root">

                        {{-- Start Dashboards --}}

                        @can('ORDER MANAGEMENT')
                            <li
                                class="sa-nav__menu-item sa-nav__menu-item--has-icon  {{ Request::is('seller') ? 'show' : '' }}">
                                <a href="{{ route('seller.dashboard.index') }}" class="sa-nav__link"><span
                                        class="sa-nav__icon">
                                        <i class="fa fa-home"></i>
                                    </span>
                                    <span
                                        class="sa-nav__title">{{ \App\CPU\translate('Dashboard') }}</span></a>
                            </li>
                        @endcan
                        {{-- End Dashboard --}}

                        {{-- Start Accounting --}}
                        <li class="sa-nav__menu-item sa-nav__menu-item--has-icon">
                            <a href="#" class="sa-nav__link"><span class="sa-nav__icon">
                                <i class="fa fa-home"></i>
                                </span><span
                                    class="sa-nav__title">{{ \App\CPU\translate('Accounting') }}</span></a>
                        </li>
                        {{-- End Accounting --}}
                        {{-- End Dashboards --}}


                        {{-- Cannot Find It !!  --}}

                        @php($seller = auth('seller')->user())
                        <!-- POS -->
                        @if (auth('seller')->user())
                            @php($sellerId = $seller->id)
                        @endif
                        @php($seller_pos = \App\Model\BusinessSetting::where('type', 'seller_pos')->first()->value)
                        @if ($seller_pos == 1)
                            @if ($seller->pos_status == 1)
                                <li class="nav-item">

                                    <small class="nav-subtitle">{{ \App\CPU\translate('pos') }}
                                        {{ \App\CPU\translate('system') }} </small>
                                    <small class="tio-more-horizontal nav-subtitle-replacer"></small>
                                </li>
                                <li
                                    class="navbar-vertical-aside-has-menu {{ Request::is('seller/pos/*') ? 'active' : '' }}">
                                    <a class="js-navbar-vertical-aside-menu-link nav-link nav-link-toggle"
                                        href="javascript:">
                                        <i class="tio-shopping nav-icon"></i>
                                        <span
                                            class="navbar-vertical-aside-mini-mode-hidden-elements text-truncate">{{ \App\CPU\translate('POS') }}</span>
                                    </a>
                                    <ul class="js-navbar-vertical-aside-submenu nav nav-sub"
                                        style="display: {{ Request::is('seller/pos/*') ? 'block' : 'none' }}">
                                        <li class="nav-item {{ Request::is('seller/pos/') ? 'active' : '' }}">
                                            <a class="nav-link " href="{{ route('seller.pos.index') }}"
                                                title="{{ \App\CPU\translate('pos') }}">
                                                <span class="tio-circle nav-indicator-icon"></span>
                                                <span class="text-truncate">{{ \App\CPU\translate('pos') }}</span>
                                            </a>
                                        </li>
                                        <li class="nav-item {{ Request::is('seller/pos/orders') ? 'active' : '' }}">
                                            <a class="nav-link " href="{{ route('seller.pos.orders') }}"
                                                title="{{ \App\CPU\translate('orders') }}">
                                                <span class="tio-circle nav-indicator-icon"></span>
                                                <span class="text-truncate">{{ \App\CPU\translate('orders') }}
                                                    <span class="badge badge-info badge-pill ml-1">
                                                        {{ \App\Model\Order::where(['seller_is' => 'seller'])->where(['seller_id' => $sellerId])->where('order_type', 'POS')->where(['order_status' => 'delivered'])->count() }}
                                                    </span>
                                                </span>
                                            </a>
                                        </li>
                                    </ul>
                                </li>
                            @endif
                        @endif

                        <!-- End POS -->

                        {{-- Cannot Find It !!  --}}


                        {{-- Start Order Management --}}
                        @can('ORDER MANAGEMENT')
                            <li class="sa-nav__section">
                                <div class="sa-nav__section-title">
                                    <span>{{ \App\CPU\translate('order_management') }}</span>
                                </div>
                                <ul class="sa-nav__menu sa-nav__menu--root">
                                    <li class="sa-nav__menu-item sa-nav__menu-item--has-icon {{ Request::is('seller/orders*') ? 'active' : '' }}"
                                        data-sa-collapse-item="sa-nav__menu-item--open">
                                        <a href="#" class="sa-nav__link" data-sa-collapse-trigger=""><span
                                                class="sa-nav__icon">
                                                <i class="fa fa-cart-shopping"></i>
                                            </span><span
                                                class="sa-nav__title">{{ \App\CPU\translate('orders') }}</span><span
                                                class="sa-nav__arrow"><svg xmlns="http://www.w3.org/2000/svg" width="6"
                                                    height="9" viewBox="0 0 6 9" fill="currentColor">
                                                    <path
                                                        d="M5.605,0.213 C6.007,0.613 6.107,1.212 5.706,1.612 L2.696,4.511 L5.706,7.409 C6.107,7.809 6.107,8.509 5.605,8.808 C5.204,9.108 4.702,9.108 4.301,8.709 L-0.013,4.511 L4.401,0.313 C4.702,-0.087 5.304,-0.087 5.605,0.213 Z">
                                                    </path>
                                                </svg></span></a>

                                        {{-- This UL Is display none because the condition --}}
                                        <ul class="sa-nav__menu sa-nav__menu--sub" data-sa-collapse-content=""
                                            style="display: {{ Request::is('seller/order*') ? 'block' : 'block' }}">
                                            <li
                                                class="sa-nav__menu-item {{ Request::is('seller/orders/list/all') ? 'active' : '' }}">
                                                <a href="{{ route('seller.orders.list', ['all']) }}"
                                                    class="sa-nav__link"><span
                                                        class="sa-nav__menu-item-padding"></span><span
                                                        class="sa-nav__title">{{ \App\CPU\translate('All') }}</span>

                                                    {{-- Badge Number --}}

                                                    <span
                                                        class="badge badge-info badge-pill {{ Session::get('direction') === 'rtl' ? 'mr-1' : 'ml-1' }}">
                                                        {{ \App\Model\Order::where('order_type', 'default_type')->where(['seller_is' => 'seller'])->where(['seller_id' => $sellerId])->count() }}
                                                    </span>
                                                </a>
                                            </li>
                                            <li
                                                class="sa-nav__menu-item {{ Request::is('seller/orders/list/pending') ? 'active' : '' }}">
                                                <a href="{{ route('seller.orders.list', ['pending']) }}"
                                                    class="sa-nav__link"><span
                                                        class="sa-nav__menu-item-padding"></span><span
                                                        class="sa-nav__title">{{ \App\CPU\translate('Pending') }}</span>
                                                    {{-- Badge Number --}}

                                                    <span
                                                        class="badge badge-soft-info badge-pill {{ Session::get('direction') === 'rtl' ? 'mr-1' : 'ml-1' }}">
                                                        {{ \App\Model\Order::where('order_type', 'default_type')->where(['seller_is' => 'seller'])->where(['seller_id' => $sellerId])->where(['order_status' => 'pending'])->count() }}
                                                    </span>
                                                </a>
                                            </li>
                                            <li
                                                class="sa-nav__menu-item {{ Request::is('seller/orders/list/confirmed') ? 'active' : '' }}">
                                                <a href="{{ route('seller.orders.list', ['confirmed']) }}"
                                                    class="sa-nav__link"><span
                                                        class="sa-nav__menu-item-padding"></span><span
                                                        class="sa-nav__title">{{ \App\CPU\translate('confirmed') }}</span>

                                                    {{-- Badge Number --}}
                                                    <span
                                                        class="badge badge-soft-info badge-pill {{ Session::get('direction') === 'rtl' ? 'mr-1' : 'ml-1' }}">
                                                        {{ \App\Model\Order::where('order_type', 'default_type')->where(['seller_is' => 'seller'])->where(['seller_id' => $sellerId])->where(['order_status' => 'confirmed'])->count() }}
                                                    </span>
                                                </a>
                                            </li>
                                            <li
                                                class="sa-nav__menu-item {{ Request::is('seller/orders/list/processing') ? 'active' : '' }}">
                                                <a href="{{ route('seller.orders.list', ['processing']) }}"
                                                    class="sa-nav__link"><span
                                                        class="sa-nav__menu-item-padding"></span><span
                                                        class="sa-nav__title">{{ \App\CPU\translate('Processing') }}</span>
                                                    <span
                                                        class="badge badge-warning badge-pill {{ Session::get('direction') === 'rtl' ? 'mr-1' : 'ml-1' }}">
                                                        {{ \App\Model\Order::where('order_type', 'default_type')->where(['seller_is' => 'seller'])->where(['seller_id' => $sellerId])->where(['order_status' => 'processing'])->count() }}
                                                    </span>
                                                </a>
                                            </li>
                                            <li
                                                class="sa-nav__menu-item {{ Request::is('seller/orders/list/out_for_delivery') ? 'active' : '' }}">
                                                <a href="{{ route('seller.orders.list', ['out_for_delivery']) }}"
                                                    class="sa-nav__link"><span
                                                        class="sa-nav__menu-item-padding"></span><span
                                                        class="sa-nav__title">{{ \App\CPU\translate('out_for_delivery') }}</span>
                                                    <span
                                                        class="badge badge-warning badge-pill {{ Session::get('direction') === 'rtl' ? 'mr-1' : 'ml-1' }}">
                                                        {{ \App\Model\Order::where('order_type', 'default_type')->where(['seller_is' => 'seller'])->where(['seller_id' => $sellerId])->where(['order_status' => 'out_for_delivery'])->count() }}
                                                    </span>
                                                </a>
                                            </li>
                                            <li
                                                class="sa-nav__menu-item {{ Request::is('seller/orders/list/delivered') ? 'active' : '' }}">
                                                <a href="{{ route('seller.orders.list', ['delivered']) }}"
                                                    class="sa-nav__link"><span
                                                        class="sa-nav__menu-item-padding"></span><span
                                                        class="sa-nav__title">{{ \App\CPU\translate('Delivered') }}</span>
                                                    <span
                                                        class="badge badge-success badge-pill {{ Session::get('direction') === 'rtl' ? 'mr-1' : 'ml-1' }}">
                                                        {{ \App\Model\Order::where('order_type', 'default_type')->where(['seller_is' => 'seller'])->where(['seller_id' => $sellerId])->where(['order_status' => 'delivered'])->count() }}
                                                    </span>
                                                </a>
                                            </li>

                                            <li
                                                class="sa-nav__menu-item {{ Request::is('seller/orders/list/returned') ? 'active' : '' }}">
                                                <a href="{{ route('seller.orders.list', ['returned']) }}"
                                                    class="sa-nav__link"><span
                                                        class="sa-nav__menu-item-padding"></span><span
                                                        class="sa-nav__title">{{ \App\CPU\translate('Returned') }}</span>
                                                    <span
                                                        class="badge badge-soft-danger badge-pill {{ Session::get('direction') === 'rtl' ? 'mr-1' : 'ml-1' }}">
                                                        {{ \App\Model\Order::where('order_type', 'default_type')->where(['seller_is' => 'seller'])->where(['seller_id' => $sellerId])->where(['order_status' => 'returned'])->count() }}
                                                    </span>
                                                </a>
                                            </li>
                                            <li
                                                class="sa-nav__menu-item {{ Request::is('seller/orders/list/failed') ? 'active' : '' }}">
                                                <a href="{{ route('seller.orders.list', ['failed']) }}"
                                                    class="sa-nav__link"><span
                                                        class="sa-nav__menu-item-padding"></span><span
                                                        class="sa-nav__title">{{ \App\CPU\translate('Failed') }}</span>
                                                    <span
                                                        class="badge badge-danger badge-pill {{ Session::get('direction') === 'rtl' ? 'mr-1' : 'ml-1' }}">
                                                        {{ \App\Model\Order::where('order_type', 'default_type')->where(['seller_is' => 'seller'])->where(['seller_id' => $sellerId])->where(['order_status' => 'failed'])->count() }}
                                                    </span>
                                                </a>
                                            </li>
                                            <li
                                                class="sa-nav__menu-item {{ Request::is('seller/orders/list/canceled') ? 'active' : '' }}">
                                                <a href="{{ route('seller.orders.list', ['canceled']) }}"
                                                    class="sa-nav__link"><span
                                                        class="sa-nav__menu-item-padding"></span><span
                                                        class="sa-nav__title">{{ \App\CPU\translate('canceled') }}</span>
                                                    <span
                                                        class="badge badge-danger badge-pill {{ Session::get('direction') === 'rtl' ? 'mr-1' : 'ml-1' }}">
                                                        {{ \App\Model\Order::where('order_type', 'default_type')->where(['seller_is' => 'seller'])->where(['seller_id' => $sellerId])->where(['order_status' => 'canceled'])->count() }}
                                                    </span>
                                                </a>
                                            </li>
                                        </ul>
                                    </li>
                                </ul>
                            </li>
                        @endcan
                        {{-- End Order Management --}}

                        {{-- Start Products Tab  --}}
                        @can('PRODUCT MANAGEMENT')
                            <li class="sa-nav__section">
                                <div class="sa-nav__section-title">
                                    <span>{{ \App\CPU\translate('product_management') }}</span>
                                </div>
                                <ul class="sa-nav__menu sa-nav__menu--root">
                                    <li class="sa-nav__menu-item sa-nav__menu-item--has-icon">
                                    <li class="sa-nav__menu-item sa-nav__menu-item--has-icon {{ Request::is('seller/product*') ? 'active' : '' }}"
                                        data-sa-collapse-item="sa-nav__menu-item--open">
                                        <a href="#" class="sa-nav__link" data-sa-collapse-trigger=""><span
                                                class="sa-nav__icon">
                                                <i class="fa fa-diamond"></i>
                                            </span><span
                                                class="sa-nav__title">{{ \App\CPU\translate('Products') }}</span><span
                                                class="sa-nav__arrow"><svg xmlns="http://www.w3.org/2000/svg"
                                                    width="6" height="9" viewBox="0 0 6 9" fill="currentColor">
                                                    <path
                                                        d="M5.605,0.213 C6.007,0.613 6.107,1.212 5.706,1.612 L2.696,4.511 L5.706,7.409 C6.107,7.809 6.107,8.509 5.605,8.808 C5.204,9.108 4.702,9.108 4.301,8.709 L-0.013,4.511 L4.401,0.313 C4.702,-0.087 5.304,-0.087 5.605,0.213 Z">
                                                    </path>
                                                </svg></span></a>
                                        <ul class="sa-nav__menu sa-nav__menu--sub" data-sa-collapse-content=""
                                            style="display: {{ Request::is('seller/product*') ? 'block' : '' }}">
                                        @endcan
                                        @can('products')
                                            <li
                                                class="sa-nav__menu-item {{ Request::is('seller/product/list') ? 'active' : '' }}">
                                                <a href="{{ route('seller.product.list') }}" class="sa-nav__link"><span
                                                        class="sa-nav__menu-item-padding"></span><span
                                                        class="sa-nav__title">{{ \App\CPU\translate('Products') }}</span></a>
                                            </li>

                                            @php($stock_limit = \App\CPU\Helpers::get_business_settings('stock_limit'))
                                            <li
                                                class="sa-nav__menu-item {{ Request::is('seller/product/stock-limit-list/in_house') ? 'active' : '' }}">
                                                <a href="{{ route('seller.product.stock-limit-list', ['in_house', '']) }}"
                                                    class="sa-nav__link"><span
                                                        class="sa-nav__menu-item-padding"></span><span
                                                        class="sa-nav__title">{{ \App\CPU\translate('stock_limit_products') }}</span>
                                                    <span class="badge badge-soft-danger badge-pill ml-1">
                                                        {{ \App\Model\Product::where(['added_by' => 'seller', 'user_id' => auth('seller')->id()])->where('request_status', 1)->where('current_stock', '<', $stock_limit)->count() }}
                                                    </span>
                                                </a>
                                            </li>
                                        </ul>
                                    </li>
                                @endcan
                                {{-- End Products Tab --}}
                                {{-- Start Services --}}
                                @can('services')
                                    <li
                                        class="sa-nav__menu-item sa-nav__menu-item--has-icon {{ Request::is('seller/product/list') ? 'active' : '' }}">
                                        <a href="{{ route('seller.service.list') }}" class="sa-nav__link"><span
                                                class="sa-nav__icon">
                                                <i class="fa fa-wrench"></i>
                                            </span><span
                                                class="sa-nav__title">{{ \App\CPU\translate('services') }}</span></a>
                                    </li>
                                @endcan
                                {{-- End Services --}}

                                {{-- Start Products Reviews --}}
                                @can('reviews')
                                    <li
                                        class="sa-nav__menu-item sa-nav__menu-item--has-icon {{ Request::is('seller/reviews/list*') ? 'active' : '' }}">
                                        <a href="{{ route('seller.reviews.list') }}" class="sa-nav__link"><span
                                                class="sa-nav__icon">
                                                <i class="fa fa-comments"></i>
                                            </span><span
                                                class="sa-nav__title">{{ \App\CPU\translate('Product') }}
                                                {{ \App\CPU\translate('Reviews') }}</span></a>
                                    </li>
                                @endcan
                                {{-- End Products Reviews --}}


                                {{-- Start Refund Request List  --}}
                                @can('refund_request_lis')
                                    <li class="sa-nav__menu-item sa-nav__menu-item--has-icon {{ Request::is('seller/refund*') ? 'active' : '' }}"
                                        data-sa-collapse-item="sa-nav__menu-item--open">
                                        <a href="#" class="sa-nav__link" data-sa-collapse-trigger=""><span
                                                class="sa-nav__icon"><svg xmlns="http://www.w3.org/2000/svg"
                                                    width="1em" height="1em" viewBox="0 0 16 16"
                                                    fill="currentColor">
                                                    <path
                                                        d="M8,6C4.7,6,2,4.7,2,3s2.7-3,6-3s6,1.3,6,3S11.3,6,8,6z M2,5L2,5L2,5C2,5,2,5,2,5z M8,8c3.3,0,6-1.3,6-3v3c0,1.7-2.7,3-6,3S2,9.7,2,8V5C2,6.7,4.7,8,8,8z M14,5L14,5C14,5,14,5,14,5L14,5z M2,10L2,10L2,10C2,10,2,10,2,10z M8,13c3.3,0,6-1.3,6-3v3c0,1.7-2.7,3-6,3s-6-1.3-6-3v-3C2,11.7,4.7,13,8,13z M14,10L14,10C14,10,14,10,14,10L14,10z">
                                                    </path>
                                                </svg></span><span
                                                class="sa-nav__title">{{ \App\CPU\translate('refund_request_list') }}</span><span
                                                class="sa-nav__arrow"><svg xmlns="http://www.w3.org/2000/svg"
                                                    width="6" height="9" viewBox="0 0 6 9" fill="currentColor">
                                                    <path
                                                        d="M5.605,0.213 C6.007,0.613 6.107,1.212 5.706,1.612 L2.696,4.511 L5.706,7.409 C6.107,7.809 6.107,8.509 5.605,8.808 C5.204,9.108 4.702,9.108 4.301,8.709 L-0.013,4.511 L4.401,0.313 C4.702,-0.087 5.304,-0.087 5.605,0.213 Z">
                                                    </path>
                                                </svg></span></a>
                                        <ul class="sa-nav__menu sa-nav__menu--sub" data-sa-collapse-content=""
                                            style="display: {{ Request::is('seller/refund*') ? 'block' : 'none' }}">
                                            <li
                                                class="sa-nav__menu-item {{ Request::is('seller/refund/list/pending') ? 'active' : '' }}">
                                                <a href="{{ route('seller.refund.list', ['pending']) }}"
                                                    class="sa-nav__link"><span
                                                        class="sa-nav__menu-item-padding"></span><span
                                                        class="sa-nav__title">{{ \App\CPU\translate('pending') }}</span>
                                                    <span class="badge badge-soft-danger badge-pill ml-1">
                                                        {{ \App\Model\RefundRequest::whereHas('order', function ($query) {
                                                            $query->where('seller_is', 'seller')->where('seller_id', auth('seller')->id());
                                                        })->where('status', 'pending')->count() }}
                                                    </span>
                                                </a>
                                            </li>
                                            <li
                                                class="sa-nav__menu-item {{ Request::is('seller/refund/list/approved') ? 'active' : '' }}">
                                                <a href="{{ route('seller.refund.list', ['approved']) }}"
                                                    class="sa-nav__link"><span
                                                        class="sa-nav__menu-item-padding"></span><span
                                                        class="sa-nav__title">{{ \App\CPU\translate('approved') }}</span>
                                                    <span class="badge badge-soft-info badge-pill ml-1">
                                                        {{ \App\Model\RefundRequest::whereHas('order', function ($query) {
                                                            $query->where('seller_is', 'seller')->where('seller_id', auth('seller')->id());
                                                        })->where('status', 'approved')->count() }}
                                                    </span>
                                                </a>
                                            </li>
                                            <li
                                                class="sa-nav__menu-item {{ Request::is('seller/refund/list/refunded') ? 'active' : '' }}">
                                                <a href="{{ route('seller.refund.list', ['refunded']) }}"
                                                    class="sa-nav__link"><span
                                                        class="sa-nav__menu-item-padding"></span><span
                                                        class="sa-nav__title">{{ \App\CPU\translate('refunded') }}</span>
                                                    <span class="badge badge-success badge-pill ml-1">
                                                        {{ \App\Model\RefundRequest::whereHas('order', function ($query) {
                                                            $query->where('seller_is', 'seller')->where('seller_id', auth('seller')->id());
                                                        })->where('status', 'refunded')->count() }}
                                                    </span>
                                                </a>
                                            </li>
                                            <li
                                                class="sa-nav__menu-item {{ Request::is('seller/refund/list/rejected') ? 'active' : '' }}">
                                                <a href="{{ route('seller.refund.list', ['rejected']) }}"
                                                    class="sa-nav__link"><span
                                                        class="sa-nav__menu-item-padding"></span><span
                                                        class="sa-nav__title">
                                                        {{ \App\CPU\translate('rejected') }}</span>
                                                    <span class="badge badge-danger badge-pill ml-1">
                                                        {{ \App\Model\RefundRequest::whereHas('order', function ($query) {
                                                            $query->where('seller_is', 'seller')->where('seller_id', auth('seller')->id());
                                                        })->where('status', 'rejected')->count() }}
                                                    </span>
                                                </a>
                                            </li>
                                        </ul>
                                    </li>
                                @endcan
                                {{-- End Refunt Request List  --}}


                                {{-- Start Messages --}}
                                @can('Messages')
                                    <li
                                        class="sa-nav__menu-item sa-nav__menu-item--has-icon {{ Request::is('seller/messages*') ? 'active' : '' }}">
                                        <a href="{{ route('seller.messages.chat') }}" class="sa-nav__link"><span
                                                class="sa-nav__icon">
                                                <i class="fa-solid fa-envelope"></i>
                                            </span>
                                            <span class="sa-nav__title">
                                                {{ \App\CPU\translate('messages') }}</span></a>
                                    </li>
                                @endcan
                                {{-- End Messages --}}

                                {{-- Start My Bank Info --}}
                                @can('My bank Info')
                                    <li
                                        class="sa-nav__menu-item sa-nav__menu-item--has-icon {{ Request::is('seller/profile*') ? 'active' : '' }}">
                                        <a href="{{ route('seller.profile.view') }}" class="sa-nav__link"><span
                                                class="sa-nav__icon">
                                                <i class="fa-solid fa-building-columns"></i>
                                            </span><span
                                                class="sa-nav__title">{{ \App\CPU\translate('my_bank_info') }}</span></a>
                                    </li>
                                @endcan
                                {{-- End My Bank Info --}}

                                {{-- Start My Shop --}}
                                @can('My shop')
                                    <li
                                        class="sa-nav__menu-item sa-nav__menu-item--has-icon {{ Request::is('seller/shop*') ? 'active' : '' }}">
                                        <a href="{{ route('seller.shop.view') }}" class="sa-nav__link"><span
                                                class="sa-nav__icon">
                                                <i class="fa-solid fa-shop"></i>
                                            </span><span
                                                class="sa-nav__title">{{ \App\CPU\translate('my_shop') }}</span></a>
                                    </li>
                                @endcan
                                {{-- End My Shop --}}


                                {{-- Start Bussiness Section  --}}
                                @can('BUSINESS SECTION')
                                    <li
                                        class="sa-nav__section {{ Request::is('seller/business-settings*') ? 'scroll-here' : '' }}">
                                        <div class="sa-nav__section-title">
                                            <span>{{ \App\CPU\translate('business_section') }}</span>
                                        </div>
                                        <ul class="sa-nav__menu sa-nav__menu--root">
                                            @php($shippingMethod = \App\CPU\Helpers::get_business_settings('shipping_method'))
                                            @if ($shippingMethod == 'sellerwise_shipping')
                                                <li
                                                    class="sa-nav__menu-item sa-nav__menu-item--has-icon {{ Request::is('seller/business-settings/shipping-method*') ? 'active' : '' }}">
                                                    <a href="{{ route('seller.business-settings.shipping-method.add') }}"
                                                        class="sa-nav__link"><span class="sa-nav__icon"><i class="fa-solid fa-gear"></i></span><span
                                                            class="sa-nav__title">{{ \App\CPU\translate('shipping_method') }}</span></a>
                                                </li>
                                            @endif
                                            <li
                                                class="sa-nav__menu-item sa-nav__menu-item--has-icon {{ Request::is('seller/business-settings/withdraws*') ? 'active' : '' }}">
                                                <a href="{{ route('seller.business-settings.withdraw.list') }}"
                                                    class="sa-nav__link"><span class="sa-nav__icon"><i class="fa-solid fa-money-bill-transfer"></i></span><span
                                                        class="sa-nav__title">{{ \App\CPU\translate('withdraws') }}</span></a>
                                            </li>
                                        @endcan
                                        @can('roles')
                                            <li
                                                class="sa-nav__menu-item sa-nav__menu-item--has-icon {{ Request::is('seller/product/list') ? 'active' : '' }}">
                                                <a href="{{ route('seller.roles.index') }}" class="sa-nav__link"><span
                                                        class="sa-nav__icon"><i class="fa fa-user-secret"></i></span><span
                                                        class="sa-nav__title">{{ \App\CPU\translate('Permissions') }}</span></a>
                                            </li>
                                        @endcan
                                        @can('roles')
                                            <li
                                                class="sa-nav__menu-item sa-nav__menu-item--has-icon {{ Request::is('seller/product/list') ? 'active' : '' }}">
                                                <a href="{{ route('seller.users.index') }}" class="sa-nav__link"><span
                                                        class="sa-nav__icon">
                                                        <i class="fa fa-users"></i>
                                                    </span><span
                                                        class="sa-nav__title">{{ \App\CPU\translate('Employee') }}</span></a>
                                            </li>

                                            @php($shipping_method = \App\CPU\Helpers::get_business_settings('shipping_method'))
                                            @if ($shipping_method == 'sellerwise_shipping')
                                                <li
                                                    class="sa-nav__section {{ Request::is('seller/delivery-man*') ? 'scroll-here' : '' }}">
                                                    <div class="sa-nav__section-title">
                                                        <span>{{ \App\CPU\translate('delivery_man_management') }}</span>
                                                    </div>
                                                    <ul class="sa-nav__menu sa-nav__menu--root">
                                                        <li class="sa-nav__menu-item sa-nav__menu-item--has-icon {{ Request::is('seller/delivery-man*') ? 'active' : '' }}"
                                                            data-sa-collapse-item="sa-nav__menu-item--open">
                                                            <a href="#" class="sa-nav__link"
                                                                data-sa-collapse-trigger=""><span
                                                                    class="sa-nav__icon"><i class="fas fa-shipping-fast"></i></span><span
                                                                    class="sa-nav__title">{{ \App\CPU\translate('delivery-man') }}</span><span
                                                                    class="sa-nav__arrow"><svg
                                                                        xmlns="http://www.w3.org/2000/svg" width="6"
                                                                        height="9" viewBox="0 0 6 9"
                                                                        fill="currentColor">
                                                                        <path
                                                                            d="M5.605,0.213 C6.007,0.613 6.107,1.212 5.706,1.612 L2.696,4.511 L5.706,7.409 C6.107,7.809 6.107,8.509 5.605,8.808 C5.204,9.108 4.702,9.108 4.301,8.709 L-0.013,4.511 L4.401,0.313 C4.702,-0.087 5.304,-0.087 5.605,0.213 Z">
                                                                        </path>
                                                                    </svg></span></a>
                                                            <ul class="sa-nav__menu sa-nav__menu--sub"
                                                                style="display: {{ Request::is('seller/delivery-man*') ? 'block' : 'none' }}"
                                                                data-sa-collapse-content="">
                                                                <li
                                                                    class="sa-nav__menu-item {{ Request::is('seller/delivery-man/add') ? 'active' : '' }}">
                                                                    <a href="{{ route('seller.delivery-man.add') }}"
                                                                        class="sa-nav__link"><span
                                                                            class="sa-nav__menu-item-padding"></span><span
                                                                            class="sa-nav__title">{{ \App\CPU\translate('add_new') }}</span></a>
                                                                </li>
                                                                <li
                                                                    class="sa-nav__menu-item {{ Request::is('seller/delivery-man/list') ? 'active' : '' }}">
                                                                    <a href="{{ route('seller.delivery-man.list') }}"
                                                                        class="sa-nav__link"><span
                                                                            class="sa-nav__menu-item-padding"></span><span
                                                                            class="sa-nav__title">{{ \App\CPU\translate('List') }}</span></a>
                                                                </li>
                                                            </ul>
                                                        </li>
                                                    </ul>
                                                </li>
                                            @endif
                                        @endcan
                                    </ul>
                                </li>
                                {{-- End Bussiness Section  --}}
                            </ul>
                        </li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
    <div class="sa-app__sidebar-shadow"></div>
    <div class="sa-app__sidebar-backdrop" data-sa-close-sidebar=""></div>
</div>
<!-- sa-app__sidebar / end -->
