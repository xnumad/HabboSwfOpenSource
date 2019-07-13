package com.sulake.habbo.catalog.clubcenter.util
{
    import flash.display.BitmapData;
    import com.sulake.habbo.session.events.BadgeImageReadyEvent;
    import com.sulake.habbo.session.ISessionDataManager;

    public class BadgeResolver 
    {
        public static const _Str_16636:String = "HC1";
        public static const _Str_16347:Array = ["ACH_VipHC1", "ACH_VipHC2", "ACH_VipHC3", "ACH_VipHC4", "ACH_VipHC5", "HC1", "HC2", "HC3", "HC4", "HC5"];


        public static function _Str_25437(k:Array):String
        {
            var _local_2:String;
            var _local_3:String;
            for each (_local_3 in _Str_16347)
            {
                if (k.indexOf(_local_3) > -1)
                {
                    _local_2 = _local_3;
                }
            }
            return _local_2;
        }

        public static function _Str_24209(k:String, _arg_2:Function, _arg_3:ISessionDataManager):BitmapData
        {
            if (k == null)
            {
                return null;
            }
            var _local_4:BitmapData = _arg_3.requestBadgeImage(k);
            if (_local_4 == null)
            {
                _arg_3.events.addEventListener(BadgeImageReadyEvent.BIRE_BADGE_IMAGE_READY, _arg_2);
            }
            return _local_4;
        }
    }
}
