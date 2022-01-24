@extends('admin.dashboard.layouts.main')
@section('container')

<div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
    <h1 class="h2">Welcome Back, {{ auth()->user()->name }}</h1>
</div>
<div class="row">
    <div class="col-md-12 grid-margin stretch-card">
        <div class="card">
            <div class="card-body dashboard-tabs p-0">
                <ul class="nav nav-tabs px-4" role="tablist">
                    <li class="nav-item">
                        <a class="nav-link active" id="overview-tab" data-toggle="tab" href="#overview" role="tab"
                            aria-controls="overview" aria-selected="true">Dashboard</a>
                    </li>
                </ul>
                <div class="tab-content py-0 px-0">
                    <div class="tab-pane fade show active" id="overview" role="tabpanel" aria-labelledby="overview-tab">
                        <div class="d-flex flex-wrap justify-content-xl-between">
                            <div
                                class="d-none d-xl-flex border-md-right flex-grow-1 align-items-center justify-content-center p-3 item">
                                <i class="mdi mdi-calendar-heart icon-lg mr-3 text-primary"></i>
                                <div class="d-flex flex-column justify-content-around">
                                    <small class="mb-1 text-muted">Tanggal</small>
                                    <h5 class="mb-0 d-inline-block">
                                        {{ tgl_indo(date('Y-m-d')) }}
                                    </h5>
                                </div>
                            </div>
                            <div
                                class="d-flex border-md-right flex-grow-1 align-items-center justify-content-center p-3 item">
                                <i class="mdi mdi-currency-usd mr-3 icon-lg text-success"></i>
                                <div class="d-flex flex-column justify-content-around">
                                    <small class="mb-1 text-muted">Pendapatan Hari Ini</small>
                                    <h5 class="mr-2 mb-0">Rp
                                        {{ number_format($pemasukan->Pemasukan, 0, ',', '.') }}</h5>
                                </div>
                            </div>
                            <div
                                class="d-flex border-md-right flex-grow-1 align-items-center justify-content-center p-3 item">
                                <i class="mdi mdi-cart-outline mr-3 icon-lg text-success"></i>
                                <div class="d-flex flex-column justify-content-around">
                                    <small class="mb-1 text-muted">Transaksi Penjualan Hari Ini</small>
                                    <h5 class="mr-2 mb-0">{{ $transaksiPenjualan }}</h5>
                                </div>
                            </div>
                            <div
                                class="d-flex border-md-right flex-grow-1 align-items-center justify-content-center p-3 item">
                                <i class="mdi mdi-cart-off mr-3 icon-lg text-danger"></i>
                                <div class="d-flex flex-column justify-content-around">
                                    <small class="mb-1 text-muted">Barang Stok Kosong</small>
                                    <h5 class="mr-2 mb-0">{{ $totalBarang }}
                                    </h5>
                                </div>
                            </div>
                            <div
                                class="d-flex py-3 border-md-right flex-grow-1 align-items-center justify-content-center p-3 item">
                                <i class="mdi mdi-information-outline mr-3 icon-lg text-warning"></i>
                                <div class="d-flex flex-column justify-content-around">
                                    <small class="mb-1 text-muted">Transaksi Butuh Update Resi</small>
                                    <h5 class="mr-2 mb-0">{{ $transaksiResi }}</h5>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="row">
    <div class="col-md-8 grid-margin stretch-card">
        <div class="card">
            <div class="card-body">
                <p class="card-title">Pendapatan 7 Hari Terakhir</p>
                <canvas id="areaChart"></canvas>
            </div>
        </div>
    </div>
</div>

@endsection