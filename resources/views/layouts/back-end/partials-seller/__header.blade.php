<!-- sa-app__toolbar -->
<div class="sa-toolbar sa-toolbar--search-hidden sa-app__toolbar">
    <div class="sa-toolbar__body">

        {{-- Start Show/Hide SideBar Button  --}}
        <div class="sa-toolbar__item">
            <button class="sa-toolbar__button" type="button" aria-label="Menu" data-sa-toggle-sidebar="">
                <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 20 20"
                    fill="currentColor">
                    <path d="M1,11V9h18v2H1z M1,3h18v2H1V3z M15,17H1v-2h14V17z"></path>
                </svg>
            </button>
        </div>

        {{-- End Show/Hide SideBar Button  --}}
        {{-- Start Languages Bar  --}}
        <div class="mx-auto"></div>
        <div class="sa-toolbar__item d-sm-none">
            <button class="sa-toolbar__button" type="button" aria-label="Show search" data-sa-action="show-search">
                <svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" viewBox="0 0 16 16"
                    fill="currentColor">
                    <path
                        d="M16.243 14.828C16.243 14.828 16.047 15.308 15.701 15.654C15.34 16.015 14.828 16.242 14.828 16.242L10.321 11.736C9.247 12.522 7.933 13 6.5 13C2.91 13 0 10.09 0 6.5C0 2.91 2.91 0 6.5 0C10.09 0 13 2.91 13 6.5C13 7.933 12.522 9.247 11.736 10.321L16.243 14.828ZM6.5 2C4.015 2 2 4.015 2 6.5C2 8.985 4.015 11 6.5 11C8.985 11 11 8.985 11 6.5C11 4.015 8.985 2 6.5 2Z">
                    </path>
                </svg>
            </button>
        </div>

        @php($local = session()->has('local') ? session('local') : 'en')
        @php($lang = \App\Model\BusinessSetting::where('type', 'language')->first())
        <div class="sa-toolbar__item dropdown">
            <button class="sa-toolbar__button" type="button" id="dropdownMenuButton3" data-bs-toggle="dropdown"
                data-bs-reference="parent" data-bs-offset="0,1" aria-expanded="false">
                @foreach (json_decode($lang['value'], true) as $data)
                    @if ($data['code'] == $local)
                        <img src="{{ asset('public/assets/front-end') }}/img/flags/{{ $data['code'] }}.png"
                            class="sa-language-icon" alt="Eng" width="20"/>
                    @endif
                @endforeach
            </button>
            <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="dropdownMenuButton3">
                @foreach (json_decode($lang['value'], true) as $key => $data)
                    @if ($data['status'] == 1)
                        <li>
                            <a class="dropdown-item pb-1" href="{{ route('lang', [$data['code']]) }}">
                                <img class="{{ Session::get('direction') === 'rtl' ? 'ml-2' : 'mr-2' }}" width="20"
                                    src="{{ asset('public/assets/front-end') }}/img/flags/{{ $data['code'] }}.png"
                                    alt="{{ $data['name'] }}" />
                                <span style="text-transform: capitalize">{{ $data['name'] }}</span>
                            </a>
                        </li>
                    @endif
                @endforeach
            </ul>
        </div>
        {{-- End Languages Bar  --}}

        {{-- Start Public Website  --}}
        <div class="sa-toolbar__item">
            <a href="{{ route('home') }}" target="_blank">
                <i class="fa fa-globe"></i>
            </a>
        </div>

        {{-- End Public Website --}}

        {{-- Start Messages --}}
        <div class="sa-toolbar__item">
            <a href="{{ route('seller.messages.chat') }}">
                <i class="fa-solid fa-envelope"></i>
                @php($message = \App\Model\Chatting::where(['seen_by_seller' => 1, 'seller_id' => auth('seller')->id()])->count())
                @if ($message != 0)
                    <span
                        class="btn-status btn-sm-status btn-status-danger">{{ \App\Model\Chatting::where(['seen_by_seller' => 1, 'sent_by_customer' => 1, 'seller_id' => auth('seller')->id()])->count() }}</span>
                @endif
            </a>
        </div>
        {{-- End Messages --}}

        {{-- Start Orders List --}}
        <div class="sa-toolbar__item">
            <a href="{{ route('seller.orders.list', ['pending']) }}">
                <i class="fa fa-cart-shopping"></i>
            </a>
        </div>
        {{-- End Orders List --}}

        {{-- Start Info --}}

        {{-- Element With website_info id is not found !  --}}

        {{-- <div class="'sa-toolbar__item">
            <a  onclick="openInfoWeb()" href="javascript:">
                <i class="fa fa-info-circle"></i>
            </a>
        </div> --}}

        {{-- End Info --}}

        {{-- Start User Account --}}
        <div class="dropdown sa-toolbar__item">
            <button class="sa-toolbar-user" type="button" id="dropdownMenuButton" data-bs-toggle="dropdown"
                data-bs-offset="0,1" aria-expanded="false">
                <span class="sa-toolbar-user__avatar sa-symbol sa-symbol--shape--rounded">
                    @if (auth('seller')->user())
                        <img onerror="this.src='{{ asset('public/assets/back-end/img/160x160/img1.jpg') }}'"
                            src="{{ asset('storage/app/public/seller/') }}/{{ auth('seller')->user()->image }}"
                            alt="Image Description" width="64" height="64" />
                    @endif
                </span>
                @if (auth('seller')->user())
                    <span class="sa-toolbar-user__info">
                        <span class="sa-toolbar-user__title">
                            {{ auth('seller')->user()->f_name }}
                        </span>
                        <span class="sa-toolbar-user__subtitle">{{ auth('seller')->user()->email }}</span>
                    @elseif(auth('employ')->user())
                        <span class="sa-toolbar-user__title">
                            {{ auth('employ')->user()->name }}
                        </span>
                        <span class="sa-toolbar-user__subtitle">{{ auth('employ')->user()->email }}</span>
                    </span>
                @endif
            </button>
            <ul class="dropdown-menu w-100" aria-labelledby="dropdownMenuButton">

                {{-- Start Account Settings --}}
                @if(auth('seller')->user())
                <li>
                    <a class="dropdown-item" href="{{route('seller.profile.update',auth('seller')->user()->id)}}">{{\App\CPU\translate('Settings')}}</a>
                </li>
                @endif

                {{-- End Account Settings --}}
                <li>
                    <hr class="dropdown-divider" />
                </li>

                {{-- Start Account Logout --}}
                <li>
                    <a class="dropdown-item"href="javascript:" onclick="Swal.fire({
                        title: '{{\App\CPU\translate('Do you want to logout')}}?',
                        showDenyButton: true,
                        showCancelButton: true,
                        confirmButtonColor: '#377dff',
                        cancelButtonColor: '#363636',
                        confirmButtonText: `Yes`,
                        denyButtonText: `Don't Logout`,
                        }).then((result) => {
                        if (result.value) {
                        location.href='{{route('seller.auth.logout')}}';
                        } else{
                        Swal.fire('Canceled', '', 'info')
                        }
                        })">
                        {{\App\CPU\translate('Sign out')}}
                    </a>
                </li>

                {{-- End Account Logout --}}
            </ul>
        </div>
    </div>
    <div class="sa-toolbar__shadow"></div>
</div>
<!-- sa-app__toolbar / end -->
