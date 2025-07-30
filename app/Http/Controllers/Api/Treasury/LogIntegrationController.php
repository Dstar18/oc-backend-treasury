<?php

namespace App\Http\Controllers\Api\Treasury;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\LogIntegration;
use Spatie\RouteDiscovery\Attributes\Route;

class LogIntegrationController extends Controller
{
    #[Route(method: 'GET')]
    public function index()
    {
        $data = LogIntegration::all();
        return response()->json($data);
    }
}
