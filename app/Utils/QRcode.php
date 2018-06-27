<?php

namespace App\Utils;

use App\Models\User;
use App\Services\Config;

class QRcode
{
    public static function decode($url)
    {
        switch (Config::get('telegram_qrcode')) {
            case 'online':
                return QRcode::online_decode($url);
            default :
                return QRcode::zxing_local_decode($url);
        }
    }
    
    public static function online_decode($url)
    {
        $data = array();
        $data['fileurl'] = $url;
        $param = http_build_query($data, '', '&');
        
        $sock = new HTTPSocket;
        $sock->connect("api.qrserver.com", 80);
        $sock->set_method('GET');
        $sock->query('/v1/read-qr-code/', $param);
        
        $raw_text = $sock->fetch_body();
        $result_array = json_decode($raw_text, true);
        if (isset($result_array[0])) {
            return $result_array[0]['symbol'][0]['data'];
        }
        return null;
    }
    
    public static function zxing_local_decode($url)
    {
        $filepath = BASE_PATH."/storage/".time().rand(1, 100).".png";
        $img = file_get_contents($url);
        file_put_contents($filepath, $img);
        
        $qrcode = new \Zxing\QrReader($filepath);
        $text = $qrcode->text(); //return decoded text from QR Code
        
        unlink($filepath);
        
        if ($text == null || $text == "") {
            return null;
        }
        
        return $text;
    }
}
