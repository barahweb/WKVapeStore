<?php

namespace App\Http\Controllers;

use App\Models\Customer;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;

class CustomerRegisterController extends Controller
{
    public function index()
    {
        return view('ui_user.dashboard.login');
    }
    public function register()
    {
        return view('ui_user.dashboard.register');
    }
    public function store(Request $request)
    {
        $validatedData = Validator::make($request->all(), [
            'name' => 'required|max:255',
            'username' => ['required', 'min:5', 'max:255', 'unique:customers'],
            'email' => 'required|email:dns|unique:customers',
            'no_hp' => 'required|unique:customers|min:8',
            'password' => 'required|min:5|max:255'
        ]);
        if ($validatedData->fails()) {
            return redirect('register')
                ->withErrors($validatedData)
                ->withInput();
        }
        $validated = $validatedData->validated();
        $validated['password'] = Hash::make($validated['password']);
        Customer::create($validated);

        $request->session()->flash('status_text', 'Berhasil Daftar!');
        return redirect('customer-login')->with('status_icon', 'success')
            ->with('status', 'Berhasil');
    }
}
