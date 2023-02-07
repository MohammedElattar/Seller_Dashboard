@extends('layouts.back-end._app-seller')

@section('title', \App\CPU\translate('Service List'))

@push('css_or_js')
@endpush

@section('content')


    <!-- sa-app__body -->
    <div id="top" class="sa-app__body">
        <div class="mx-sm-2 px-2 px-sm-3 px-xxl-4 pb-6">
            <div class="container">
                <div class="py-5">
                    <div class="row g-4 align-items-center">
                        <div class="col">
                            <h1 class="h3 m-0">{{ \App\CPU\translate('Service') }} {{ \App\CPU\translate('Table') }} </h1>
                        </div>
                        <div class="col-auto d-flex">
                            <a href="{{ route('seller.service.add-new') }}"
                                class="btn btn-primary">{{ \App\CPU\translate('Add new Service') }}</a>
                        </div>
                    </div>
                </div>
                <div class="card">
                    <div class="p-4">
                        <input type="text" placeholder="{{ \App\CPU\translate('Search by Service Name') }}"
                            class="form-control form-control--search mx-auto" id="table-search" />
                    </div>
                    <div class="sa-divider"></div>
                    <style>
                        .services-table a:hover{
                            text-decoration: none;
                        }
                    </style>
                    <table class="sa-datatables-init services-table" data-order='[[ 1, "asc" ]]' data-sa-search-input="#table-search">
                        <thead>
                            <tr>
                                <th>{{ \App\CPU\translate('SL#') }}</th>
                                <th>{{ \App\CPU\translate('Service Name') }}</th>
                                {{-- <th>{{\App\CPU\translate('purchase_price')}}</th> --}}
                                <th>{{ \App\CPU\translate('selling_price') }}</th>
                                <th>{{ \App\CPU\translate('verify_status') }}</th>
                                <th>{{ \App\CPU\translate('Active') }} {{ \App\CPU\translate('status') }}</th>
                                <th class="w-min" data-orderable="false">{{ \App\CPU\translate('Action') }}</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach ($products as $k => $p)
                                <tr>
                                    <td>
                                        {{ $products->firstitem() + $k }}
                                    </td>
                                    <td><a href="{{ route('seller.service.view', [$p['id']]) }}">
                                            {{ \Illuminate\Support\Str::limit($p['name'], 40) }}
                                        </a></td>
                                    <td>
                                        {{ \App\CPU\BackEndHelper::set_symbol(\App\CPU\BackEndHelper::usd_to_currency($p['price'])) }}
                                    </td>
                                    <td>
                                        @if ($p->request_status == 0)
                                            <label
                                                class="badge badge-sa-warning">{{ \App\CPU\translate('New Request') }}</label>
                                        @elseif($p->request_status == 1)
                                            <label
                                                class="badge badge-sa-success">{{ \App\CPU\translate('Approved') }}</label>
                                        @elseif($p->request_status == 2)
                                            <label class="badge badge-sa-danger">{{ \App\CPU\translate('Denied') }}</label>
                                        @endif
                                    </td>
                                    <td>
                                        <label class="switch">
                                            <input type="checkbox" class="status" id="{{ $p['id'] }}"
                                                {{ $p->status == 1 ? 'checked' : '' }}>
                                            <span class="slider round"></span>
                                        </label>
                                    </td>
                                    <td class="d-flex flex-row">
                                        {{--                                            <a class="btn btn-warning btn-sm" title="{{ \App\CPU\translate('barcode') }}" --}}
                                        {{--                                                    href="{{ route('seller.service.barcode', [$p['id']]) }}"> --}}
                                        {{--                                                    <i class="tio-barcode"></i> --}}
                                        {{--                                                </a> --}}

                                        {{--                                            <a class="btn btn-info btn-sm" --}}
                                        {{--                                                title="{{\App\CPU\translate('view')}}" --}}
                                        {{--                                                href="{{route('seller.service.view',[$p['id']])}}"> --}}
                                        {{--                                                <i class="tio-visible"></i> --}}
                                        {{--                                            </a> --}}
                                        <a class="btn btn-primary btn-sm" title="{{ \App\CPU\translate('Edit') }}"
                                            href="{{ route('seller.service.edit', [$p['id']]) }}">
                                            <i class="fa fa-edit"></i>
                                        </a>
                                        <a class="btn btn-danger btn-sm" href="javascript:"
                                            title="{{ \App\CPU\translate('Delete') }}"
                                            onclick="form_alert('product-{{ $p['id'] }}','{{ \App\CPU\translate('Want to delete this item') }} ?')">
                                            <i class="fa fa-trash"></i>
                                        </a>
                                        <form action="{{ route('seller.service.delete', [$p['id']]) }}" method="post"
                                            id="product-{{ $p['id'] }}">
                                            @csrf @method('delete')
                                        </form>
                                    </td>
                                </tr>
                            @endforeach
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
    <!-- sa-app__body / end -->


@endsection

@push('script')
    <!-- Page level plugins -->
    <script src="{{ asset('public/assets/back-end') }}/vendor/datatables/jquery.dataTables.min.js"></script>
    <script src="{{ asset('public/assets/back-end') }}/vendor/datatables/dataTables.bootstrap4.min.js"></script>

    <script>
        // Call the dataTables jQuery plugin
        $(document).ready(function() {
            $('#dataTable').DataTable();
        });

        $(document).on('change', '.status', function() {
            var id = $(this).attr("id");
            if ($(this).prop("checked") == true) {
                var status = 1;
            } else if ($(this).prop("checked") == false) {
                var status = 0;
            }
            $.ajaxSetup({
                headers: {
                    'X-CSRF-TOKEN': $('meta[name="_token"]').attr('content')
                }
            });
            $.ajax({
                url: "{{ route('seller.service.status-update') }}",
                method: 'POST',
                data: {
                    id: id,
                    status: status
                },
                success: function(data) {
                    if (data.success == true) {
                        toastr.success('{{ \App\CPU\translate('Status updated successfully') }}');
                    } else if (data.success == false) {
                        toastr.error(
                            '{{ \App\CPU\translate('Status updated failed. Service must be approved') }}'
                        );
                    }
                }
            });
        });
    </script>
@endpush
