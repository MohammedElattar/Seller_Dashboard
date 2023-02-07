<style>
    .close {
        z-index: 99;
        background: white !important;
        padding: 3px 8px !important;
        margin: -23px -12px -1rem auto !important;
        border-radius: 50%;
    }
</style>
@php($banner=\App\Model\Banner::inRandomOrder()->where(['published'=>1,'banner_type'=>'Popup Banner'])->first())
@if(isset($banner))
    <div class="modal fade" id="popup-modal">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header" style="padding: 1px;border-bottom: 0px!important;">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body" style="padding: 3px!important; cursor: pointer"
                     onclick="location.href='{{$banner['url']}}'">
                    <img class="d-block w-100"
                         onerror="this.src='{{asset('public/assets/front-end/img/image-place-holder.png')}}'"
                         src="{{asset('storage/app/public/banner')}}/{{$banner['photo']}}"
                         alt="">
                </div>
            </div>
        </div>
    </div>
@endif


<!-- edit product modal start-->
<div class="modal fade bd-example-modal-lg theme-modal pro-edit-modal" id="edit-product" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
        <div class="modal-content ">
            <div class="modal-body">
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                <div class="pro-group">
                    <div class="product-img">
                        <div class="media">
                            <div class="img-wraper">
                                <a href="product-page(left-sidebar).html">
                                    <img src="assets/images/mega-store/product/9.jpg"  alt="" class="img-fluid">
                                </a>
                            </div>
                            <div class="media-body">
                                <a href="product-page(left-sidebar).html">
                                    <h3>redmi not 3</h3>
                                </a>
                                <h6>$80<span>$120</span></h6>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="pro-group">
                    <h6 class="product-title">Select Size</h6>
                    <div class="size-box">
                        <ul>
                            <li ><a href="javascript:void(0)">s</a></li>
                            <li><a href="javascript:void(0)">m</a></li>
                            <li><a href="javascript:void(0)">l</a></li>
                            <li><a href="javascript:void(0)">xl</a></li>
                            <li><a href="javascript:void(0)">2xl</a></li>
                        </ul>
                    </div>
                </div>
                <div class="pro-group">
                    <h6 class="product-title">Select color</h6>
                    <div class="color-selector inline">
                        <ul>
                            <li>
                                <div class="color-1 active"></div>
                            </li>
                            <li>
                                <div class="color-2"></div>
                            </li>
                            <li>
                                <div class="color-3"></div>
                            </li>
                            <li>
                                <div class="color-4"></div>
                            </li>
                            <li>
                                <div class="color-5"></div>
                            </li>
                            <li>
                                <div class="color-6"></div>
                            </li>
                            <li>
                                <div class="color-7"></div>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="pro-group">
                    <h6 class="product-title">Quantity</h6>
                    <div class="qty-box">
                        <div class="input-group">
                            <button class="qty-minus"></button>
                            <input class="qty-adj form-control" type="number" value="1"/>
                            <button class="qty-plus"></button>
                        </div>
                    </div>
                </div>
                <div class="pro-group mb-0">
                    <div class="modal-btn">
                        <a href="cart.html" class="btn btn-solid btn-sm">
                            add to cart
                        </a>
                        <a href="product-page(left-sidebar).html" class="btn btn-solid btn-sm">
                            more detail
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- edit product modal end-->

<!-- Add to cart bar -->
@php($cart=\App\CPU\CartManager::get_cart())
<div id="cart_side" class="add_to_cart right ">
    <a href="javascript:void(0)" class="overlay" onclick="closeCart()"></a>
    <div class="cart-inner">
        <div class="cart_top">
            <h3>my cart</h3>
            <div class="close-cart">
                <a href="javascript:void(0)" onclick="closeCart()">
                    <i class="fa fa-times" aria-hidden="true"></i>
                </a>
            </div>
        </div>
        <div class="cart_media">
            <ul class="cart_product">
                @php($sub_total=0)
                @php($total_tax=0)
                @if($cart->count() > 0)

                    @foreach($cart as  $cartItem)
                        <li>
                            <div class="media">
                                <a href="{{route('product',$cartItem['slug'])}}">
                                    <img alt="megastore1" class="me-3" src="{{\App\CPU\ProductManager::product_image_path('thumbnail')}}/{{$cartItem['thumbnail']}}">
                                </a>
                                <div class="media-body">
                                    <a href="{{route('product',$cartItem['slug'])}}">
                                        <h4>{{Str::limit($cartItem['name'],30)}}</h4>
                                        @foreach(json_decode($cartItem['variations'],true) as $key =>$variation)
                                            <span style="font-size: 14px">{{$key}} : {{$variation}}</span><br>
                                        @endforeach
                                    </a>
                                    <h6>
                                        {{\App\CPU\Helpers::currency_converter(($cartItem['price']-$cartItem['discount'])*$cartItem['quantity'])}}
                                        <span>{{\App\CPU\Helpers::currency_converter($cartItem['price']*$cartItem['quantity'])}}</span>
                                    </h6>
                                    <div class="addit-box">
                                        <div class="qty-box">
                                            <div class="input-group">
                                                <input class="qty-adj form-control" id="count{{ $cartItem['id'] }}" type="number" min="1" value="{{$cartItem['quantity']}}"/>
                                            </div>
                                        </div>
                                        <div class="pro-add">
                                            <a href="javascript:void(0)" onclick="updateQuantity({{ $cartItem['id'] }},$('#count{{ $cartItem['id'] }}'))" >
                                                <i data-feather="edit"></i>
                                            </a>
                                            <a href="removeFromCart({{ $cartItem['id'] }})">
                                                <i  data-feather="trash-2"></i>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </li>
                        @php($sub_total+=($cartItem['price']-$cartItem['discount'])*$cartItem['quantity'])
                        @php($total_tax+=$cartItem['tax']*$cartItem['quantity'])
                    @endforeach
                @endif

            </ul>
            <ul class="cart_total">
                <li>
                    subtotal : <span>{{\App\CPU\Helpers::currency_converter($sub_total)}}</span>
                </li>

                <li>
                    <div class="buttons">
                        <a href="{{route('shop-cart')}}" class="btn btn-solid btn-sm">{{\App\CPU\translate('Expand cart')}}</a>
                    </div>
                </li>
            </ul>
        </div>
    </div>
</div>

>
<!-- Add to cart bar end-->


<!-- Add to wishlist bar -->
<div id="wishlist_side" class="add_to_cart right ">
    <a href="javascript:void(0)" class="overlay" onclick="closeWishlist()"></a>
    <div class="cart-inner">
        <div class="cart_top">
            <h3>my wishlist</h3>
            <div class="close-cart">
                <a href="javascript:void(0)" onclick="closeWishlist()">
                    <i class="fa fa-times" aria-hidden="true"></i>
                </a>
            </div>
        </div>
        <div class="cart_media">
            <ul class="cart_product">
                <li>
                    <div class="media">
                        <a href="product-page(left-sidebar).html">
                            <img alt="megastore1" class="me-3" src="assets/images/mega-store/product/1.jpg">
                        </a>
                        <div class="media-body">
                            <a href="product-page(left-sidebar).html">
                                <h4>women fashion shoes</h4>
                            </a>
                            <h6>
                                $80.00 <span>$120.00</span>
                            </h6>
                            <div class="addit-box">
                                <div class="qty-box">
                                    <div class="input-group">
                                        <button class="qty-minus"></button>
                                        <input class="qty-adj form-control" type="number" value="1"/>
                                        <button class="qty-plus"></button>
                                    </div>
                                </div>
                                <div class="pro-add">
                                    <a href="javascript:void(0)" data-bs-toggle="modal" data-bs-target="#edit-product" >
                                        <i data-feather="edit"></i>
                                    </a>
                                    <a href="javascript:void(0)">
                                        <i  data-feather="trash-2"></i>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </li>
                <li>
                    <div class="media">
                        <a href="product-page(left-sidebar).html">
                            <img alt="megastore1" class="me-3" src="assets/images/mega-store/product/2.jpg">
                        </a>
                        <div class="media-body">
                            <a href="product-page(left-sidebar).html">
                                <h4>men analogue watch</h4>
                            </a>
                            <h6>
                                $80.00 <span>$120.00</span>
                            </h6>
                            <div class="addit-box">
                                <div class="qty-box">
                                    <div class="input-group">
                                        <button class="qty-minus"></button>
                                        <input class="qty-adj form-control" type="number" value="1"/>
                                        <button class="qty-plus"></button>
                                    </div>
                                </div>
                                <div class="pro-add">
                                    <a href="javascript:void(0)" data-bs-toggle="modal" data-bs-target="#edit-product" >
                                        <i data-feather="edit"></i>
                                    </a>
                                    <a href="javascript:void(0)">
                                        <i  data-feather="trash-2"></i>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </li>
                <li>
                    <div class="media">
                        <a href="product-page(left-sidebar).html">
                            <img alt="megastore1" class="me-3" src="assets/images/mega-store/product/3.jpg">
                        </a>
                        <div class="media-body">
                            <a href="product-page(left-sidebar).html">
                                <h4>wireless  headphones</h4>
                            </a>
                            <h6>
                                $80.00 <span>$120.00</span>
                            </h6>
                            <div class="addit-box">
                                <div class="qty-box">
                                    <div class="input-group">
                                        <button class="qty-minus"></button>
                                        <input class="qty-adj form-control" type="number" value="1"/>
                                        <button class="qty-plus"></button>
                                    </div>
                                </div>
                                <div class="pro-add">
                                    <a href="javascript:void(0)" data-bs-toggle="modal" data-bs-target="#edit-product" >
                                        <i data-feather="edit"></i>
                                    </a>
                                    <a href="javascript:void(0)">
                                        <i  data-feather="trash-2"></i>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </li>
            </ul>
            <ul class="cart_total">
                <li>
                    subtotal : <span>$1050.00</span>
                </li>
                <li>
                    shpping <span>free</span>
                </li>
                <li>
                    taxes <span>$0.00</span>
                </li>
                <li>
                    <div class="total">
                        total<span>$1050.00</span>
                    </div>
                </li>
                <li>
                    <div class="buttons">
                        <a href="wishlist.html" class="btn btn-solid btn-block btn-md">view wislist</a>
                    </div>
                </li>
            </ul>
        </div>
    </div>
</div>
<!-- Add to wishlist bar end-->

<!-- add to  setting bar  start-->
<div id="mySetting" class="add_to_cart right">
    <a href="javascript:void(0)" class="overlay" onclick="closeSetting()"></a>
    <div class="cart-inner">
        <div class="cart_top">
            <h3>{{ \App\CPU\translate('Profile Settings') }}</h3>
            <div class="close-cart">
                <a href="javascript:void(0)" onclick="closeSetting()">
                    <i class="fa fa-times" aria-hidden="true"></i>
                </a>
            </div>
        </div>
        <div class="setting-block">
            <div class="form-group">
                <a class="btn btn-circle" href="{{ url('/lang/en') }}">english</a>
                <a class="btn btn-circle" href="{{ url('/lang/fr') }}">frensh</a>
                <a class="btn btn-circle" href="{{ url('/lang/eg') }}">arabic</a>
            </div>
        </div>
    </div>
</div>
<!-- add to  setting bar  end-->
