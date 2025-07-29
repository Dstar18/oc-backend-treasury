<?php

namespace App\Http\Controllers\Api\Treasury;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Spatie\RouteDiscovery\Attributes\Route;
use App\Data\InfoData;

class InfoController extends Controller
{
    #[Route(method: 'GET')]
    public function index()
    {
        $params = [
            'id'    => 1,
            'name'  => 'Bintang'
        ];
        // Convert array menjadi DTO
        $result = InfoData::from($params);
        return response()->json($result->toArray());
    }
}
