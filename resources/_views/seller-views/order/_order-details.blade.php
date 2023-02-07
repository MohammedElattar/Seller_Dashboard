@extends('layouts.back-end._app-seller')

@section('title', \App\CPU\translate('Order Details'))
@push('css_or_js')
@endpush
@section('content')

    <!-- sa-app__body -->
    <div id="top" class="sa-app__body">
        <div class="mx-sm-2 px-2 px-sm-3 px-xxl-4 pb-6">
            <div class="container container--max--xl">
                <div class="py-5">
                    <div class="row g-4 align-items-center">
                        <div class="col">
                            <h1 class="h3 m-0">{{ \App\CPU\translate('Order') }} #{{ $order['id'] }}</h1>
                        </div>
                    </div>
                </div>
                <div class="sa-page-meta mb-5">
                    <div class="sa-page-meta__body">
                        <div class="sa-page-meta__list">
                            <div class="sa-page-meta__item">
                                <i class="fa fa-calendar"></i> {{ date('d M Y H:i:s', strtotime($order['created_at'])) }}
                            </div>
                            <div class="sa-page-meta__item d-flex align-items-center fs-6">
                                @if ($order['payment_status'] == 'paid')
                                    <span class="badge badge-sa-success me-2">{{ \App\CPU\translate('Paid') }}</span>
                                @else
                                    <span class="badge badge-sa-danger me-2">{{ \App\CPU\translate('Unpaid') }}</span>
                                @endif
                                @if ($order['order_status'] == 'pending')
                                    <span class="badge badge-sa-info me-2">{{ \App\CPU\translate('pending') }}</span>
                                @elseif($order['order_status'] == 'failed')
                                    <span class="badge badge-sa-danger me-2">{{ \App\CPU\translate('failed') }}</span>
                                @elseif($order['order_status'] == 'processing' || $order['order_status'] == 'out_for_delivery')
                                    <span
                                        class="badge badge-sa-warning me-2">{{ \App\CPU\translate($order['order_status'] == 'processing' ? 'processing' : 'out_for_delivery') }}</span>
                                @elseif($order['order_status'] == 'delivered' || $order['order_status'] == 'confirmed')
                                    <span
                                        class="badge badge-sa-success me-2">{{ \App\CPU\translate($order['order_status'] == 'delivered' ? 'delivered' : 'confirmed') }}</span>
                                @else
                                    <span
                                        class="badge badge-sa-warning me-2">{{ str_replace('_', ' ', $order['order_status']) }}</span>
                                @endif
                            </div>
                        </div>
                    </div>
                </div>
                <div class="sa-entity-layout">
                    <a class="text-body" target="_blank" href={{ route('seller.orders.generate-invoice', [$order->id]) }}>
                        <i class="fa fa-print"></i> {{ \App\CPU\translate('Print invoice') }}
                    </a>
                    @if (isset($shipping_address['latitude']) && isset($shipping_address['longitude']))
                        <button class="btn btn-xs btn-secondary" data-toggle="modal" data-target="#locationModal"><i
                                class="tio-map"></i> {{ \App\CPU\translate('show_locations_on_map') }}</button>
                    @else
                        <button class="btn btn-xs btn-warning"><i class="tio-map"></i>
                            {{ \App\CPU\translate('no_location_found') }}</button>
                    @endif
                </div>
                <div class="d-flex flex-column mt-4" style="width: 50%">
                    <div class="col-6 col-sm-6 hs-unfold float-right mb-3">
                        <div class="dropdown">
                            <select name="order_status" onchange="order_status(this.value)" class="status form-control"
                                data-id="{{ $order['id'] }}">

                                <option value="pending" {{ $order->order_status == 'pending' ? 'selected' : '' }}>
                                    {{ \App\CPU\translate('Pending') }}</option>
                                <option value="confirmed" {{ $order->order_status == 'confirmed' ? 'selected' : '' }}>
                                    {{ \App\CPU\translate('Confirmed') }}</option>
                                <option value="processing" {{ $order->order_status == 'processing' ? 'selected' : '' }}>
                                    {{ \App\CPU\translate('Processing') }} </option>

                                @php($shippingMethod = \App\CPU\Helpers::get_business_settings('shipping_method'))
                                @if ($shippingMethod == 'sellerwise_shipping')
                                    <option value="out_for_delivery"
                                        {{ $order->order_status == 'out_for_delivery' ? 'selected' : '' }}>
                                        {{ \App\CPU\translate('out_for_delivery') }} </option>
                                    <option value="delivered" {{ $order->order_status == 'delivered' ? 'selected' : '' }}>
                                        {{ \App\CPU\translate('Delivered') }} </option>
                                    <option value="returned" {{ $order->order_status == 'returned' ? 'selected' : '' }}>
                                        {{ \App\CPU\translate('Returned') }}</option>
                                    <option value="failed" {{ $order->order_status == 'failed' ? 'selected' : '' }}>
                                        {{ \App\CPU\translate('Failed') }} </option>
                                    <option value="canceled" {{ $order->order_status == 'canceled' ? 'selected' : '' }}>
                                        {{ \App\CPU\translate('Canceled') }} </option>
                                @endif
                            </select>
                        </div>
                    </div>

                    @if ($order['payment_method'] == 'cash_on_delivery' && $shipping_method == 'sellerwise_shipping')
                        <div class="col-6 col-sm-6 hs-unfold float-right pr-2">
                            <div class="dropdown">
                                <select name="payment_status" class="payment_status form-control"
                                    data-id="{{ $order['id'] }}">
                                    <option
                                        onclick="route_alert('{{ route('admin.orders.payment-status', ['id' => $order['id'], 'payment_status' => 'paid']) }}','{{ \App\CPU\translate('Change status to paid') }} ?')"
                                        href="javascript:" value="paid"
                                        {{ $order->payment_status == 'paid' ? 'selected' : '' }}>
                                        {{ \App\CPU\translate('Paid') }}
                                    </option>
                                    <option value="unpaid" {{ $order->payment_status == 'unpaid' ? 'selected' : '' }}>
                                        {{ \App\CPU\translate('Unpaid') }}
                                    </option>
                                </select>
                            </div>
                        </div>
                    @endif
                </div>
                <div class="sa-entity-layout" data-sa-container-query='{"920":"sa-entity-layout--size--md"}'
                    style="text-align: {{ Session::get('direction') === 'rtl' ? 'right' : 'left' }};">
                    <div class="sa-entity-layout__body">
                        <div class="sa-entity-layout__main">
                            <div class="card mt-5">
                                <div class="card-body px-5 py-4 d-flex align-items-center justify-content-between">
                                    <h2 class="mb-0 fs-exact-18 me-4">
                                        {{ \App\CPU\translate('Order details') }}
                                        <span
                                            class="badge badge-sa-success rounded-circle {{ Session::get('direction') === 'rtl' ? 'mr-1' : 'ml-1' }}">{{ $order->details->count() }}</span>
                                    </h2>
                                </div>
                                {{-- <div class="col-6 pt-2">
                                    @if ($order->order_note != null)
                                        <span class="font-weight-bold text-capitalize">
                                            {{ \App\CPU\translate('order_note') }} :
                                        </span>
                                        <p class="pl-1">
                                            {{ $order->order_note }}
                                        </p>
                                    @endif
                                </div>
                                <div class="col-6 pt-2">
                                    <div class="flex-end">
                                        <h6 class="text-capitalize" style="color: #8a8a8a;">
                                            {{ \App\CPU\translate('payment_method') }} :</h6>
                                        <h6 class="mx-1" style="color: #8a8a8a;">
                                            {{ str_replace('_', ' ', $order['payment_method']) }}</h6>
                                    </div>
                                    <div class="flex-end">
                                        <h6 style="color: #8a8a8a;">{{ \App\CPU\translate('Payment') }}
                                            {{ \App\CPU\translate('reference') }}
                                            :</h6>
                                        <h6 class="mx-1" style="color: #8a8a8a;">
                                            {{ str_replace('_', ' ', $order['transaction_ref']) }}</h6>
                                    </div>

                                </div> --}}
                                <div class=" table table-responsive">
                                    <table class="sa-table">
                                        @php($subtotal = 0)
                                        @php($total = 0)
                                        @php($shipping = 0)
                                        @php($discount = 0)
                                        @php($tax = 0)
                                        <tbody>
                                            @foreach ($order->details as $detail)
                                                @if ($detail->product)
                                                    <tr>
                                                        <td class="min-w-20x">
                                                            <div class="d-flex align-items-center">
                                                                {{-- <img src="{{ \App\CPU\ProductManager::product_image_path('thumbnail') }}/{{ $detail->product['thumbnail'] }}" class="me-4"
                                                                width="40" height="40" alt=""
                                                                onerror="this.src='{{ asset('public/assets/front-end/img/image-place-holder.png') }}'"
                                                                alt="Image Description"
                                                                /> --}}
                                                                <img onerror="this.src='{{ asset('public/assets/front-end/img/image-place-holder.png') }}'"
                                                                    src="{{ \App\CPU\ProductManager::product_image_path('thumbnail') }}/{{ $detail->product['thumbnail'] }}"
                                                                    width="40" height="40" alt="Image Description">
                                                                <span class="d-flex flex-column">
                                                                    <p>
                                                                        {{ substr($detail->product['name'], 0, 10) }}{{ strlen($detail->product['name']) > 10 ? '...' : '' }}
                                                                    </p>
                                                                    <strong><u>{{ \App\CPU\translate('variation') }} :
                                                                        </u></strong>

                                                                    <div class="font-size-sm text-body">
                                                                        <span
                                                                            class="font-weight-bold">{{ $detail['variant'] }}</span>
                                                                    </div>

                                                                </span>
                                                            </div>
                                                        </td>
                                                        <td class="text-end">
                                                            <div class="sa-price">
                                                                <span
                                                                    class="sa-price__symbol">{{ \App\CPU\BackEndHelper::set_symbol(\App\CPU\BackEndHelper::usd_to_currency($detail['price'])) }}</span>
                                                            </div>
                                                        </td>
                                                        <td class="text-end">
                                                            {{ $detail->qty }}
                                                        </td>
                                                        <td>
                                                            {{ \App\CPU\BackEndHelper::set_symbol(\App\CPU\BackEndHelper::usd_to_currency($detail['tax'])) }}
                                                        </td>
                                                        <td>
                                                            {{ \App\CPU\BackEndHelper::set_symbol(\App\CPU\BackEndHelper::usd_to_currency($detail['discount'])) }}
                                                        </td>
                                                        <td class="text-end">
                                                            <div class="sa-price">
                                                                <span>
                                                                    @php($subtotal = $detail['price'] * $detail->qty + $detail['tax'] - $detail['discount'])
                                                                    {{ \App\CPU\BackEndHelper::set_symbol(\App\CPU\BackEndHelper::usd_to_currency($subtotal)) }}
                                                                </span>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    @php($discount += $detail['discount'])
                                                    @php($tax += $detail['tax'])
                                                    @php($shipping += $detail->shipping ? $detail->shipping->cost : 0)
                                                    @php($total += $subtotal)
                                                @endif
                                            @endforeach
                                        </tbody>
                                        <tbody class="sa-table__group">
                                            @php($shipping = $order['shipping_cost'])
                                            @php($coupon_discount = $order['discount_amount'])
                                            <tr>
                                                <td colspan="3">
                                                    {{ \App\CPU\translate('coupon_discount') }}
                                                </td>
                                                <td class="text-end">
                                                    <div class="sa-price">
                                                        <strong>-
                                                            {{ \App\CPU\BackEndHelper::set_symbol(\App\CPU\BackEndHelper::usd_to_currency($coupon_discount)) }}</strong>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="3">
                                                    {{ \App\CPU\translate('Shipping') }}
                                                </td>
                                                <td class="text-end">
                                                    <div class="sa-price">
                                                        <span>
                                                            <strong>{{ \App\CPU\BackEndHelper::set_symbol(\App\CPU\BackEndHelper::usd_to_currency($shipping)) }}</strong>
                                                        </span>
                                                    </div>
                                                </td>
                                            </tr>
                                        </tbody>
                                        <tbody>
                                            <tr>
                                                <td colspan="3">
                                                    {{ \App\CPU\translate('Total') }}
                                                </td>
                                                <td class="text-end">
                                                    <div class="sa-price">
                                                        <strong>{{ \App\CPU\BackEndHelper::set_symbol(\App\CPU\BackEndHelper::usd_to_currency($total + $shipping - $coupon_discount)) }}</strong>
                                                    </div>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <div class="card mt-5">
                                <div class="card-body px-5 py-4 d-flex align-items-center justify-content-between">
                                    <h2 class="mb-0 fs-exact-18 me-4">
                                        Transactions
                                    </h2>
                                    <div class="text-muted fs-exact-14">
                                        <a href="#">Add transaction</a>
                                    </div>
                                </div>
                                <div class="table-responsive">
                                    <table class="sa-table text-nowrap">
                                        <tbody>
                                            <tr>
                                                <td>
                                                    Payment
                                                    <div class="text-muted fs-exact-13">
                                                        via PayPal
                                                    </div>
                                                </td>
                                                <td>
                                                    October 7, 2020
                                                </td>
                                                <td class="text-end">
                                                    <div class="sa-price">
                                                        <span class="sa-price__symbol">$</span><span
                                                            class="sa-price__integer">2,000</span><span
                                                            class="sa-price__decimal">.00</span>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    Payment
                                                    <div class="text-muted fs-exact-13">
                                                        from account
                                                        balance
                                                    </div>
                                                </td>
                                                <td>
                                                    November 2, 2020
                                                </td>
                                                <td class="text-end">
                                                    <div class="sa-price">
                                                        <span class="sa-price__symbol">$</span><span
                                                            class="sa-price__integer">50</span><span
                                                            class="sa-price__decimal">.00</span>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    Refund
                                                    <div class="text-muted fs-exact-13">
                                                        to PayPal
                                                    </div>
                                                </td>
                                                <td>
                                                    December 10,
                                                    2020
                                                </td>
                                                <td class="text-end text-danger">
                                                    <div class="sa-price">
                                                        <span class="sa-price__symbol">$</span><span
                                                            class="sa-price__integer">-325</span><span
                                                            class="sa-price__decimal">.00</span>
                                                    </div>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <div class="card mt-5">
                                <div class="card-body px-5 py-4 d-flex align-items-center justify-content-between">
                                    <h2 class="mb-0 fs-exact-18 me-4">
                                        Balance
                                    </h2>
                                </div>
                                <table class="sa-table">
                                    <tbody class="sa-table__group">
                                        <tr>
                                            <td>Order Total</td>
                                            <td class="text-end">
                                                <div class="sa-price">
                                                    <span class="sa-price__symbol">$</span><span
                                                        class="sa-price__integer">5,882</span><span
                                                        class="sa-price__decimal">.00</span>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Return Total</td>
                                            <td class="text-end">
                                                <div class="sa-price">
                                                    <span class="sa-price__symbol">$</span><span
                                                        class="sa-price__integer">0</span><span
                                                        class="sa-price__decimal">.00</span>
                                                </div>
                                            </td>
                                        </tr>
                                    </tbody>
                                    <tbody class="sa-table__group">
                                        <tr>
                                            <td>
                                                Paid by customer
                                            </td>
                                            <td class="text-end">
                                                <div class="sa-price">
                                                    <span class="sa-price__symbol">$</span><span
                                                        class="sa-price__integer">-80</span><span
                                                        class="sa-price__decimal">.00</span>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Refunded</td>
                                            <td class="text-end">
                                                <div class="sa-price">
                                                    <span class="sa-price__symbol">$</span><span
                                                        class="sa-price__integer">0</span><span
                                                        class="sa-price__decimal">.00</span>
                                                </div>
                                            </td>
                                        </tr>
                                    </tbody>
                                    <tbody>
                                        <tr>
                                            <td>
                                                Balance
                                                <span class="text-muted">(customer owes
                                                    you)</span>
                                            </td>
                                            <td class="text-end">
                                                <div class="sa-price">
                                                    <span class="sa-price__symbol">$</span><span
                                                        class="sa-price__integer">5,802</span><span
                                                        class="sa-price__decimal">.00</span>
                                                </div>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div class="sa-entity-layout__sidebar">
                            <div class="card">
                                <div class="card-body d-flex align-items-center justify-content-between pb-0 pt-4">
                                    <h2 class="fs-exact-16 mb-0">
                                        Customer
                                    </h2>
                                    <a href="#" class="fs-exact-14">Edit</a>
                                </div>
                                <div class="card-body d-flex align-items-center pt-4">
                                    <div class="sa-symbol sa-symbol--shape--circle sa-symbol--size--lg">
                                        <img src="images/customers/customer-1-40x40.jpg" width="40" height="40"
                                            alt="" />
                                    </div>
                                    <div class="ms-3 ps-2">
                                        <div class="fs-exact-14 fw-medium">
                                            Jessica Moore
                                        </div>
                                        <div class="fs-exact-13 text-muted">
                                            This is a first order
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="card mt-5">
                                <div class="card-body d-flex align-items-center justify-content-between pb-0 pt-4">
                                    <h2 class="fs-exact-16 mb-0">
                                        Contact person
                                    </h2>
                                    <a href="#" class="fs-exact-14">Edit</a>
                                </div>
                                <div class="card-body pt-4 fs-exact-14">
                                    <div>Jessica Moore</div>
                                    <div class="mt-1">
                                        <a href="#">moore@example.com</a>
                                    </div>
                                    <div class="text-muted mt-1">
                                        +38 (094) 730-24-25
                                    </div>
                                </div>
                            </div>
                            <div class="card mt-5">
                                <div class="card-body d-flex align-items-center justify-content-between pb-0 pt-4">
                                    <h2 class="fs-exact-16 mb-0">
                                        Shipping Address
                                    </h2>
                                    <a href="#" class="fs-exact-14">Edit</a>
                                </div>
                                <div class="card-body pt-4 fs-exact-14">
                                    Jessica Moore<br />Random
                                    Federation<br />115302,
                                    Moscow<br />ul. Varshavskaya,
                                    15-2-178
                                </div>
                            </div>
                            <div class="card mt-5">
                                <div class="card-body d-flex align-items-center justify-content-between pb-0 pt-4">
                                    <h2 class="fs-exact-16 mb-0">
                                        Billing Address
                                    </h2>
                                    <a href="#" class="fs-exact-14">Edit</a>
                                </div>
                                <div class="card-body pt-4 fs-exact-14">
                                    Jessica Moore<br />Random
                                    Federation<br />115302,
                                    Moscow<br />ul. Varshavskaya,
                                    15-2-178
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- sa-app__body / end -->

@endsection
@push('script')
    <script>
        $(document).on('change', '.payment_status', function() {
            var id = $(this).attr("data-id");
            var value = $(this).val();
            Swal.fire({
                title: '{{ \App\CPU\translate('Are you sure Change this?') }}',
                text: "{{ \App\CPU\translate('You wont be able to revert this!') }}",
                showCancelButton: true,
                confirmButtonColor: '#377dff',
                cancelButtonColor: 'secondary',
                confirmButtonText: '{{ \App\CPU\translate('Yes, Change it') }}!'
            }).then((result) => {
                if (result.value) {
                    $.ajaxSetup({
                        headers: {
                            'X-CSRF-TOKEN': $('meta[name="_token"]').attr('content')
                        }
                    });
                    $.ajax({
                        url: "{{ route('seller.orders.payment-status') }}",
                        method: 'POST',
                        data: {
                            "id": id,
                            "payment_status": value
                        },
                        success: function(data) {
                            if (data.customer_status == 0) {
                                toastr.warning(
                                    '{{ \App\CPU\translate('Account has been deleted, you can not change the status!') }}!'
                                );
                                // location.reload();
                            } else {
                                toastr.success(
                                    '{{ \App\CPU\translate('Status Change successfully') }}'
                                );
                                // location.reload();
                            }
                        }
                    });
                }
            })
        });

        function order_status(status) {
            var value = status;
            Swal.fire({
                title: '{{ \App\CPU\translate('Are you sure Change this?') }}',
                text: "{{ \App\CPU\translate('You wont be able to revert this!') }}",
                showCancelButton: true,
                confirmButtonColor: '#377dff',
                cancelButtonColor: 'secondary',
                confirmButtonText: '{{ \App\CPU\translate('Yes, Change it!') }}'
            }).then((result) => {
                if (result.value) {
                    $.ajaxSetup({
                        headers: {
                            'X-CSRF-TOKEN': $('meta[name="_token"]').attr('content')
                        }
                    });
                    $.ajax({
                        url: "{{ route('seller.orders.status') }}",
                        method: 'POST',
                        data: {
                            "id": '{{ $order['id'] }}',
                            "order_status": value
                        },
                        success: function(data) {
                            if (data.success == 0) {
                                toastr.success(
                                    '{{ \App\CPU\translate('Order is already delivered, You can not change it !!') }}'
                                );
                                // location.reload();
                            } else {
                                if (data.payment_status == 0) {
                                    toastr.warning(
                                        '{{ \App\CPU\translate('Before delivered you need to make payment status paid!') }}!'
                                    );
                                    // location.reload();
                                } else if (data.customer_status == 0) {
                                    toastr.warning(
                                        '{{ \App\CPU\translate('Account has been deleted, you can not change the status!') }}!'
                                    );
                                    // location.reload();
                                } else {
                                    toastr.success(
                                        '{{ \App\CPU\translate('Status Change successfully') }}!');
                                    // location.reload();
                                }
                            }
                        }
                    });
                }
            })
        }
    </script>
    <script>
        $(document).ready(function() {
            let delivery_type = '{{ $order->delivery_type }}';

            if (delivery_type === 'self_delivery') {
                $('#choose_delivery_man').show();
                $('#by_third_party_delivery_service_info').hide();
            } else if (delivery_type === 'third_party_delivery') {
                $('#choose_delivery_man').hide();
                $('#by_third_party_delivery_service_info').show();
            } else {
                $('#choose_delivery_man').hide();
                $('#by_third_party_delivery_service_info').hide();
            }
        });
    </script>
    <script>
        function choose_delivery_type(val) {

            if (val === 'self_delivery') {
                $('#choose_delivery_man').show();
                $('#by_third_party_delivery_service_info').hide();
            } else if (val === 'third_party_delivery') {
                $('#choose_delivery_man').hide();
                $('#by_third_party_delivery_service_info').show();
                $('#shipping_chose').modal("show");
            } else {
                $('#choose_delivery_man').hide();
                $('#by_third_party_delivery_service_info').hide();
            }

        }
    </script>
    <script>
        function addDeliveryMan(id) {
            $.ajax({
                type: "GET",
                url: '{{ url('/') }}/seller/orders/add-delivery-man/{{ $order['id'] }}/' + id,
                data: {
                    'order_id': '{{ $order['id'] }}',
                    'delivery_man_id': id
                },
                success: function(data) {
                    if (data.status == true) {
                        toastr.success('Delivery man successfully assigned/changed', {
                            CloseButton: true,
                            ProgressBar: true
                        });
                    } else {
                        toastr.error('Deliveryman man can not assign/change in that status', {
                            CloseButton: true,
                            ProgressBar: true
                        });
                    }
                },
                error: function() {
                    toastr.error('Add valid data', {
                        CloseButton: true,
                        ProgressBar: true
                    });
                }
            });
        }

        function last_location_view() {
            toastr.warning('Only available when order is out for delivery!', {
                CloseButton: true,
                ProgressBar: true
            });
        }

        function waiting_for_location() {
            toastr.warning('{{ \App\CPU\translate('waiting_for_location') }}', {
                CloseButton: true,
                ProgressBar: true
            });
        }
    </script>
    <script
        src="https://maps.googleapis.com/maps/api/js?key={{ \App\CPU\Helpers::get_business_settings('map_api_key') }}&v=3.49">
    </script>
    <script>
        function initializegLocationMap() {
            var map = null;
            var myLatlng = new google.maps.LatLng({{ $shipping_address->latitude }}, {{ $shipping_address->longitude }});
            var dmbounds = new google.maps.LatLngBounds(null);
            var locationbounds = new google.maps.LatLngBounds(null);
            var dmMarkers = [];
            dmbounds.extend(myLatlng);
            locationbounds.extend(myLatlng);

            var myOptions = {
                center: myLatlng,
                zoom: 13,
                mapTypeId: google.maps.MapTypeId.ROADMAP,

                panControl: true,
                mapTypeControl: false,
                panControlOptions: {
                    position: google.maps.ControlPosition.RIGHT_CENTER
                },
                zoomControl: true,
                zoomControlOptions: {
                    style: google.maps.ZoomControlStyle.LARGE,
                    position: google.maps.ControlPosition.RIGHT_CENTER
                },
                scaleControl: false,
                streetViewControl: false,
                streetViewControlOptions: {
                    position: google.maps.ControlPosition.RIGHT_CENTER
                }
            };
            map = new google.maps.Map(document.getElementById("location_map_canvas"), myOptions);
            console.log(map);
            var infowindow = new google.maps.InfoWindow();

            @if ($shipping_address && isset($shipping_address))
                var marker = new google.maps.Marker({
                    position: new google.maps.LatLng({{ $shipping_address->latitude }},
                        {{ $shipping_address->longitude }}),
                    map: map,
                    title: "{{ $order->customer['f_name'] ?? '' }} {{ $order->customer['l_name'] ?? '' }}",
                    icon: "{{ asset('public/assets/front-end/img/customer_location.png') }}"
                });

                google.maps.event.addListener(marker, 'click', (function(marker) {
                    return function() {
                        infowindow.setContent(
                            "<div style='float:left'><img style='max-height:40px;wide:auto;' src='{{ asset('storage/app/public/profile/') }}{{ $order->customer->image ?? '' }}'></div><div style='float:right; padding: 10px;'><b>{{ $order->customer->f_name ?? '' }} {{ $order->customer->l_name ?? '' }}</b><br/>{{ $shipping_address->address }}</div>"
                        );
                        infowindow.open(map, marker);
                    }
                })(marker));
                locationbounds.extend(marker.getPosition());
            @endif

            google.maps.event.addListenerOnce(map, 'idle', function() {
                map.fitBounds(locationbounds);
            });
        }

        // Re-init map before show modal
        $('#locationModal').on('shown.bs.modal', function(event) {

            initializegLocationMap();
        });
    </script>
@endpush
