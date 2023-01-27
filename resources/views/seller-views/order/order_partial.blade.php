<div class="mx-sm-2 px-2 px-sm-3 px-xxl-4 pb-6">
    <div class="container container--max--xl">
        <div class="py-5">
            <div class="row g-4 align-items-center">
                <div class="col">
                    <h1 class="h3 m-0">
                        {{ \App\CPU\translate('Order') }} {{ \App\CPU\translate('status') }}</span>
                        <span class="">{{ $orders->total() }}</span>
                    </h1>
                </div>
            </div>
        </div>
        <div class="row g-3">
            <h4>{{ \App\CPU\translate('orders') }} {{ \App\CPU\translate('status') }}</h4>
            <div class="col-6 col-md-4 col-lg-3" style="flex-grow:1;">
                <div class="card text-center">
                    <a href="{{ route('seller.orders.list', ['pending']) }}"
                        class="text-reset p-5 text-decoration-none sa-hover-area">
                        <div class="fs-4 mb-4 text-muted opacity-50">
                            <svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" viewBox="0 0 24 24"
                                fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round"
                                stroke-linejoin="round" class="feather feather-truck">
                                <rect x="1" y="3" width="15" height="13"></rect>
                                <polygon points="16 8 20 8 23 11 23 16 16 16 16 8"></polygon>
                                <circle cx="5.5" cy="18.5" r="2.5"></circle>
                                <circle cx="18.5" cy="18.5" r="2.5"></circle>
                            </svg>
                        </div>
                        <h2 class="fs-6 fw-medium mb-3">
                            {{ \App\CPU\translate('pending') }}
                        </h2>
                        <div class="text-muted fs-exact-14">
                            {{ \App\Model\Order::where('order_type', 'default_type')->where(['seller_is' => 'seller'])->where(['seller_id' => $sellerId])->where(['order_status' => 'pending'])->count() }}
                        </div>
                    </a>
                </div>
            </div>
            <div class="col-6 col-md-4 col-lg-3">
                <div class="card text-center">
                    <a href="{{ route('seller.orders.list', ['confirmed']) }}"
                        class="text-reset p-5 text-decoration-none sa-hover-area">
                        <div class="fs-4 mb-4 text-muted opacity-50">
                            <svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" viewBox="0 0 24 24"
                                fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round"
                                stroke-linejoin="round" class="feather feather-credit-card">
                                <rect x="1" y="4" width="22" height="16" rx="2"
                                    ry="2"></rect>
                                <line x1="1" y1="10" x2="23" y2="10"></line>
                            </svg>
                        </div>
                        <h2 class="fs-6 fw-medium mb-3">
                            {{ \App\CPU\translate('confirmed') }}
                        </h2>
                        <div class="text-muted fs-exact-14">
                            {{ \App\Model\Order::where('order_type', 'default_type')->where('seller_is', 'seller')->where(['seller_id' => $sellerId])->where(['order_status' => 'confirmed'])->count() }}
                        </div>
                    </a>
                </div>
            </div>
            <div class="col-6 col-md-4 col-lg-3">
                <div class="card text-center">
                    <a href="{{ route('seller.orders.list', ['processing']) }}"
                        class="text-reset p-5 text-decoration-none sa-hover-area">
                        <div class="fs-4 mb-4 text-muted opacity-50">
                            <svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" viewBox="0 0 24 24"
                                fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round"
                                stroke-linejoin="round" class="feather feather-users">
                                <path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"></path>
                                <circle cx="9" cy="7" r="4"></circle>
                                <path d="M23 21v-2a4 4 0 0 0-3-3.87"></path>
                                <path d="M16 3.13a4 4 0 0 1 0 7.75"></path>
                            </svg>
                        </div>
                        <h2 class="fs-6 fw-medium mb-3">
                            {{ \App\CPU\translate('Processing') }}
                        </h2>
                        <div class="text-muted fs-exact-14">
                            {{ \App\Model\Order::where('order_type', 'default_type')->where(['order_status' => 'processing'])->where('seller_is', 'seller')->where(['seller_id' => $sellerId])->count() }}
                        </div>
                    </a>
                </div>
            </div>
            <div class="col-6 col-md-4 col-lg-3">
                <div class="card text-center">
                    <a href="{{ route('seller.orders.list', ['out_for_delivery']) }}"
                        class="text-reset p-5 text-decoration-none sa-hover-area">
                        <div class="fs-4 mb-4 text-muted opacity-50">
                            <svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" viewBox="0 0 24 24"
                                fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round"
                                stroke-linejoin="round" class="feather feather-mail">
                                <path d="M4 4h16c1.1 0 2 .9 2 2v12c0 1.1-.9 2-2 2H4c-1.1 0-2-.9-2-2V6c0-1.1.9-2 2-2z">
                                </path>
                                <polyline points="22,6 12,13 2,6"></polyline>
                            </svg>
                        </div>
                        <h2 class="fs-6 fw-medium mb-3">
                            {{ \App\CPU\translate('out_for_delivery') }}
                        </h2>
                        <div class="text-muted fs-exact-14">
                            {{ \App\Model\Order::where('order_type', 'default_type')->where('seller_is', 'seller')->where(['seller_id' => $sellerId])->where(['order_status' => 'out_for_delivery'])->count() }}
                        </div>
                    </a>
                </div>
            </div>
            <div class="col-6 col-md-4 col-lg-3">
                <div class="card text-center">
                    <a href="{{ route('seller.orders.list', ['delivered']) }}"
                        class="text-reset p-5 text-decoration-none sa-hover-area">
                        <div class="fs-4 mb-4 text-muted opacity-50">
                            <svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em"
                                viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"
                                stroke-linecap="round" stroke-linejoin="round" class="feather feather-dollar-sign">
                                <line x1="12" y1="1" x2="12" y2="23"></line>
                                <path d="M17 5H9.5a3.5 3.5 0 0 0 0 7h5a3.5 3.5 0 0 1 0 7H6"></path>
                            </svg>
                        </div>
                        <h2 class="fs-6 fw-medium mb-3">
                            {{ \App\CPU\translate('delivered') }}
                        </h2>
                        <div class="text-muted fs-exact-14">
                            {{ \App\Model\Order::where('order_type', 'default_type')->where('seller_is', 'seller')->where(['seller_id' => $sellerId])->where(['order_status' => 'delivered'])->count() }}
                        </div>
                    </a>
                </div>
            </div>
            <div class="col-6 col-md-4 col-lg-3">
                <div class="card text-center">
                    <a href='{{ route('seller.orders.list', ['canceled']) }}'
                        class="text-reset p-5 text-decoration-none sa-hover-area">
                        <div class="fs-4 mb-4 text-muted opacity-50">
                            <svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em"
                                viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"
                                stroke-linecap="round" stroke-linejoin="round" class="feather feather-globe">
                                <circle cx="12" cy="12" r="10"></circle>
                                <line x1="2" y1="12" x2="22" y2="12"></line>
                                <path
                                    d="M12 2a15.3 15.3 0 0 1 4 10 15.3 15.3 0 0 1-4 10 15.3 15.3 0 0 1-4-10 15.3 15.3 0 0 1 4-10z">
                                </path>
                            </svg>
                        </div>
                        <h2 class="fs-6 fw-medium mb-3">
                            {{ \App\CPU\translate('canceled') }}
                        </h2>
                        <div class="text-muted fs-exact-14">
                            {{ \App\Model\Order::where('order_type', 'default_type')->where('seller_is', 'seller')->where(['seller_id' => $sellerId])->where(['order_status' => 'canceled'])->count() }}
                        </div>
                    </a>
                </div>
            </div>
            <div class="col-6 col-md-4 col-lg-3">
                <div class="card text-center">
                    <a href='{{ route('seller.orders.list', ['returned']) }}'
                        class="text-reset p-5 text-decoration-none sa-hover-area">
                        <div class="fs-4 mb-4 text-muted opacity-50">
                            <svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em"
                                viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"
                                stroke-linecap="round" stroke-linejoin="round" class="feather feather-unlock">
                                <rect x="3" y="11" width="18" height="11" rx="2"
                                    ry="2"></rect>
                                <path d="M7 11V7a5 5 0 0 1 9.9-1"></path>
                            </svg>
                        </div>
                        <h2 class="fs-6 fw-medium mb-3">
                            {{ \App\CPU\translate('returned') }}
                        </h2>
                        <div class="text-muted fs-exact-14">
                            {{ \App\Model\Order::where('order_type', 'default_type')->where('seller_is', 'seller')->where(['seller_id' => $sellerId])->where(['order_status' => 'returned'])->count() }}
                        </div>
                    </a>
                </div>
            </div>
            <div class="col-6 col-md-4 col-lg-3">
                <div class="card text-center">
                    <a href='{{ route('seller.orders.list', ['failed']) }}'
                        class="text-reset p-5 text-decoration-none sa-hover-area">
                        <div class="fs-4 mb-4 text-muted opacity-50">
                            <svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em"
                                viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"
                                stroke-linecap="round" stroke-linejoin="round" class="feather feather-percent">
                                <line x1="19" y1="5" x2="5" y2="19"></line>
                                <circle cx="6.5" cy="6.5" r="2.5"></circle>
                                <circle cx="17.5" cy="17.5" r="2.5"></circle>
                            </svg>
                        </div>
                        <h2 class="fs-6 fw-medium mb-3">
                            {{ \App\CPU\translate('failed') }}
                        </h2>
                        <div class="text-muted fs-exact-14">
                            {{ \App\Model\Order::where('order_type', 'default_type')->where('seller_is', 'seller')->where(['seller_id' => $sellerId])->where(['order_status' => 'failed'])->count() }}
                        </div>
                    </a>
                </div>
            </div>
        </div>
    </div>
</div>


<div class="mx-sm-2 px-2 px-sm-3 px-xxl-4 pb-6">
    <div class="container container--max--xl">
        <div class="row g-3">
            <h4>{{ \App\CPU\translate('payment') }} {{ \App\CPU\translate('status') }}</h4>
            <div class="col-6 col-md-4 col-lg-3" style="flex-grow:1;">
                <div class="card text-center">
                    <a href='{{ route('seller.orders.list', ['paid']) }}'
                        class="text-reset p-5 text-decoration-none sa-hover-area">
                        <div class="fs-4 mb-4 text-muted opacity-50">
                            <svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em"
                                viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"
                                stroke-linecap="round" stroke-linejoin="round" class="feather feather-truck">
                                <rect x="1" y="3" width="15" height="13"></rect>
                                <polygon points="16 8 20 8 23 11 23 16 16 16 16 8"></polygon>
                                <circle cx="5.5" cy="18.5" r="2.5"></circle>
                                <circle cx="18.5" cy="18.5" r="2.5"></circle>
                            </svg>
                        </div>
                        <h2 class="fs-6 fw-medium mb-3">
                            {{ \App\CPU\translate('paid') }}
                        </h2>
                        <div class="text-muted fs-exact-14">
                            {{ \App\Model\Order::where('order_type', 'default_type')->where('seller_is', 'seller')->where(['seller_id' => $sellerId])->where(['payment_status' => 'paid'])->count() }}
                        </div>
                    </a>
                </div>
            </div>
            <div class="col-6 col-md-4 col-lg-3" style="flex-grow:1;">
                <div class="card text-center">
                    <a href='{{ route('seller.orders.list', ['unpaid']) }}'
                        class="text-reset p-5 text-decoration-none sa-hover-area">
                        <div class="fs-4 mb-4 text-muted opacity-50">
                            <svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em"
                                viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"
                                stroke-linecap="round" stroke-linejoin="round" class="feather feather-credit-card">
                                <rect x="1" y="4" width="22" height="16" rx="2"
                                    ry="2"></rect>
                                <line x1="1" y1="10" x2="23" y2="10"></line>
                            </svg>
                        </div>
                        <h2 class="fs-6 fw-medium mb-3">
                            {{ \App\CPU\translate('unpaid') }}
                        </h2>
                        <div class="text-muted fs-exact-14">
                            {{ \App\Model\Order::where('order_type', 'default_type')->where('seller_is', 'seller')->where(['seller_id' => $sellerId])->where(['payment_status' => 'unpaid'])->count() }}
                        </div>
                    </a>
                </div>
            </div>
        </div>


        <div class="py-5">
            <div class="row g-4 align-items-center">
                <div class="col">
                    <h1 class="h3 m-0">{{ \App\CPU\translate('orders') }}</h1>
                </div>
                <div class="col-auto d-flex">
                <form action="" method="GET" id="form-data" class="d-flex">
                    <div class="col-auto d-flex">
                        <input class="btn btn-primary"  type="date" name="from" id="from_date" value="{{ $from }}"
                                                        class="form-control mt-2" title="{{ \App\CPU\translate('from') }} {{ \App\CPU\translate('date') }}">
                    </div>
                    <div class="col-auto d-flex">
                        <input type="date" name="to" id="to_date" value="{{ $to }}"
                                                        class="form-control mt-2" title="{{ ucfirst(\App\CPU\translate('to')) }} {{ \App\CPU\translate('date') }}">
                    </div>
                    <div class="col-auto d-flex">
                        <button type="submit" class="btn btn-primary" onclick="formUrlChange(this)" data-action="{{ url()->current() }}">
                            {{\App\CPU\translate('filter')}}
                        </button>
                    </div>
                    <div class="col-auto d-flex">
                        <button type="submit" class="btn btn-success" onclick="formUrlChange(this)" data-action="{{ route('seller.orders.order-bulk-export', ['status' => $status]) }}">
                            {{\App\CPU\translate('export')}}
                        </button>
                    </div>
                </form>
            </div>
            </div>
        </div>
        <div class="card">
            <div class="p-4">
                <input type="text" placeholder="{{\App\CPU\translate('search')}}"
                    class="form-control form-control--search mx-auto" id="table-search" />
            </div>
            <div class="sa-divider"></div>
            <table class="sa-datatables-init text-nowrap" data-order='[[ 1, "desc" ]]'
                data-sa-search-input="#table-search"
                style="text-align: {{Session::get('direction') === "rtl" ? 'right' : 'left'}};"
                >
                <thead>
                    <tr>
                        <th>{{\App\CPU\translate('SL#')}}</th>
                                    <th>{{\App\CPU\translate('Order')}}</th>
                                    <th>{{\App\CPU\translate('Date')}}</th>
                                    <th>{{\App\CPU\translate('customer_name')}}</th>
                                    <th>{{\App\CPU\translate('Phone')}}</th>
                                    <th>{{\App\CPU\translate('Payment')}}</th>
                                    <th>{{\App\CPU\translate('Status')}} </th>
                        <th class="w-min" data-orderable="false"></th>
                    </tr>
                </thead>
                <tbody>
                    @foreach($orders as $k=>$order)
                    <tr>
                        <td>
                            {{$orders->firstItem()+$k}}
                        </td>
                        <td>
                            <a href="{{route('seller.orders.details',$order['id'])}}">{{$order['id']}}</a>
                        </td>
                        <td>{{date('d M Y',strtotime($order['created_at']))}}</td>
                        <td> {{$order->customer ? $order->customer['f_name'].' '.$order->customer['l_name'] : 'Customer Data not found'}}</td>
                        <td>{{ $order->customer ? $order->customer->phone : '' }}</td>
                        <td>
                            @if($order->payment_status=='paid')
                                <span class="badge badge-sa-success">
                                {{\App\CPU\translate('paid')}}
                                </span>
                            @else
                                <span class="badge badge-sa-danger">
                                {{\App\CPU\translate('unpaid')}}
                                </span>
                            @endif
                            </td>
                            <td class="text-capitalize ">
                                @if($order->order_status=='pending')
                                    <label
                                        class="badge badge-sa-primary">{{\App\CPU\translate('pending')}}</label>
                                @elseif($order->order_status=='processing' || $order->order_status=='out_for_delivery')
                                    <label
                                        class="badge badge-sa-warning">{{\App\CPU\translate($order->order_status == 'processing' ? 'processing' : 'out_for_delivery')}}</label>
                                @elseif($order->order_status=='delivered' || $order->order_status=='confirmed')
                                    <label
                                        class="badge badge-sa-success">{{\App\CPU\translate($order->order_status == 'delivered' ? 'delivered' : 'confirmed')}}</label>
                                @elseif($order->order_status=='returned')
                                Undefined1
                                    <label
                                        class="badge badge-sa-danger">{{ \App\CPU\translate('returned') }}</label>
                                @else
                                    <label
                                        class="badge badge-sa-danger">{{$order['order_status']}}</label>
                                @endif
                            </td>
                        
                        <td>
                            <div class="dropdown">
                                <button class="btn btn-sa-muted btn-sm" type="button" id="order-context-menu-0"
                                    data-bs-toggle="dropdown" aria-expanded="false" aria-label="More">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="3" height="13"
                                        fill="currentColor">
                                        <path
                                            d="M1.5,8C0.7,8,0,7.3,0,6.5S0.7,5,1.5,5S3,5.7,3,6.5S2.3,8,1.5,8z M1.5,3C0.7,3,0,2.3,0,1.5S0.7,0,1.5,0 S3,0.7,3,1.5S2.3,3,1.5,3z M1.5,10C2.3,10,3,10.7,3,11.5S2.3,13,1.5,13S0,12.3,0,11.5S0.7,10,1.5,10z">
                                        </path>
                                    </svg>
                                </button>
                                <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="order-context-menu-0">
                                    <li>
                                        <a class="dropdown-item" href="#">Edit</a>
                                    </li>
                                    <li>
                                        <a class="dropdown-item" href="#">Duplicate</a>
                                    </li>
                                    <li>
                                        <a class="dropdown-item" href="#">Add tag</a>
                                    </li>
                                    <li>
                                        <a class="dropdown-item" href="#">Remove tag</a>
                                    </li>
                                    <li>
                                        <hr class="dropdown-divider" />
                                    </li>
                                    <li>
                                        <a class="dropdown-item text-danger" href="#">Delete</a>
                                    </li>
                                </ul>
                            </div>
                        </td>
                    </tr>
                    @endforeach
                </tbody>
            </table>
        </div>
    </div>
</div>
