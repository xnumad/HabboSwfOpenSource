package com.sulake.habbo.campaign.calendar
{
    import __AS3__.vec.Vector;
    import flash.geom.Point;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.core.window.components.IStaticBitmapWrapperWindow;
    import com.sulake.habbo.communication.messages.parser.campaign.CampaignCalendarData;
    import com.sulake.core.window.components.IBitmapWrapperWindow;
    import flash.display.BitmapData;
    import com.sulake.core.window.IWindow;

    public class CalendarItem 
    {
        public static const _Str_5399:int = 1;
        public static const _Str_8424:int = 2;
        public static const _Str_10321:int = 3;
        public static const _Str_10951:int = 4;
        private static const CAMPAIGN_DAY_GENERIC_BUTTON:String = "campaign_day_generic_button";
        private static const CAMPAIGN_DAY_GENERIC_ACTIVATED:String = "campaign_day_generic_activated";
        private static const CAMPAIGN_OPENED:String = "campaign_opened";
        private static const CAMPAIGN_GENERIC_LOCK:String = "campaign_generic_lock";
        private static const _Str_21760:Vector.<Point> = new <Point>[new Point(-2, -5), new Point(3, -4), new Point(-3, -3)];


        public static function _Str_15147(k:IWindowContainer, _arg_2:CampaignCalendarData, _arg_3:int):IWindowContainer
        {
            var _local_4:IWindowContainer = (k.clone() as IWindowContainer);
            var _local_5:IStaticBitmapWrapperWindow = (_local_4.findChildByName("bitmap_bg") as IStaticBitmapWrapperWindow);
            var _local_6:IStaticBitmapWrapperWindow = (_local_4.findChildByName("bitmap_opened_bg") as IStaticBitmapWrapperWindow);
            var _local_7:IStaticBitmapWrapperWindow = (_local_4.findChildByName("bitmap_lock") as IStaticBitmapWrapperWindow);
            var _local_8:int = _Str_9903(_arg_2, _arg_3);
            switch (_local_8)
            {
                case CalendarItem._Str_8424:
                    _local_5.assetUri = CAMPAIGN_DAY_GENERIC_BUTTON;
                    _local_7.assetUri = null;
                    _local_6.visible = false;
                    break;
                case CalendarItem._Str_10321:
                case CalendarItem._Str_10951:
                    _local_5.assetUri = CAMPAIGN_DAY_GENERIC_BUTTON;
                    _local_7.assetUri = CAMPAIGN_GENERIC_LOCK;
                    _local_6.visible = false;
                    break;
                case CalendarItem._Str_5399:
                    _local_5.assetUri = CAMPAIGN_DAY_GENERIC_ACTIVATED;
                    _local_7.assetUri = "";
                    _local_6.visible = true;
                    break;
            }
            return _local_4;
        }

        public static function _Str_3820(k:IWindowContainer, _arg_2:CampaignCalendarData, _arg_3:int, _arg_4:int):void
        {
            var _local_5:IStaticBitmapWrapperWindow = (k.findChildByName("bitmap_bg") as IStaticBitmapWrapperWindow);
            if (!_local_5)
            {
                return;
            }
            if (_arg_3 == _arg_4)
            {
                if (_Str_9903(_arg_2, _arg_3) == CalendarItem._Str_8424)
                {
                    _Str_6955(_local_5);
                }
            }
        }

        public static function _Str_13922(k:IWindowContainer, _arg_2:Object):void
        {
            var _local_3:IStaticBitmapWrapperWindow = (k.findChildByName("bitmap_bg") as IStaticBitmapWrapperWindow);
            var _local_4:IStaticBitmapWrapperWindow = (k.findChildByName("bitmap_opened_bg") as IStaticBitmapWrapperWindow);
            var _local_5:IStaticBitmapWrapperWindow = (k.findChildByName("bitmap_icon") as IStaticBitmapWrapperWindow);
            var _local_6:IBitmapWrapperWindow = (k.findChildByName("bitmap_icon2") as IBitmapWrapperWindow);
            _local_3.assetUri = CAMPAIGN_DAY_GENERIC_ACTIVATED;
            _local_6.y = (_local_5.y = -6);
            _local_4.visible = true;
            if ((_arg_2 is String))
            {
                _local_5.assetUri = (_arg_2 as String);
                _local_6.bitmap = null;
                _Str_6955(_local_5);
            }
            if ((_arg_2 is BitmapData))
            {
                _local_5.assetUri = "";
                _local_6.bitmap = (_arg_2 as BitmapData);
                _Str_6955(_local_5);
                _Str_6955(_local_6);
            }
        }

        public static function _Str_6955(k:IWindow):void
        {
            new CalendarItemWiggle(k);
        }

        public static function _Str_9903(k:CampaignCalendarData, _arg_2:int):int
        {
            if (k._Str_10724.indexOf(_arg_2) > -1)
            {
                return CalendarItem._Str_5399;
            }
            switch (true)
            {
                case (_arg_2 > k._Str_5472):
                    return CalendarItem._Str_10951;
                case (k._Str_14267.indexOf(_arg_2) > -1):
                    return CalendarItem._Str_10321;
            }
            return CalendarItem._Str_8424;
        }
    }
}

