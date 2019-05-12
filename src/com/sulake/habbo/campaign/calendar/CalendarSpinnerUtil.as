package com.sulake.habbo.campaign.calendar
{
    import com.sulake.core.window.components.IBitmapWrapperWindow;
    import flash.display.BitmapData;
    import flash.display.Sprite;
    import flash.geom.Matrix;
    import flash.display.GradientType;

    public class CalendarSpinnerUtil 
    {


        public static function _Str_25753(k:CalendarView, _arg_2:int):void
        {
            var _local_3:IBitmapWrapperWindow = (k.window.findChildByName("gradient1") as IBitmapWrapperWindow);
            var _local_4:int = Math.max(1, (k._Str_18893(_arg_2) - (k.itemList.scrollH * k.itemList.maxScrollH)));
            var _local_5:BitmapData = new BitmapData(_local_4, k.itemList.height, true, 0);
            var _local_6:Sprite = new Sprite();
            var _local_7:Matrix = new Matrix();
            _local_7.createGradientBox(_local_5.width, _local_5.height);
            _local_6.graphics.beginGradientFill(GradientType.LINEAR, [987168, 987168], [0.6, 0.2], [0, 0xFF], _local_7);
            _local_6.graphics.drawRect(0, 0, _local_5.width, _local_5.height);
            _local_5.draw(_local_6);
            _local_3.bitmap = _local_5;
            _local_3 = (k.window.findChildByName("gradient2") as IBitmapWrapperWindow);
            _local_4 = Math.max(1, (k._Str_8780 - ((_local_4 + k._Str_13395) + k._Str_18214)));
            _local_5 = new BitmapData(_local_4, k.itemList.height, true, 0);
            _local_7.createGradientBox(_local_5.width, _local_5.height);
            _local_6.graphics.clear();
            _local_6.graphics.beginGradientFill(GradientType.LINEAR, [987168, 987168], [0.2, 0.6], [0, 0xFF], _local_7);
            _local_6.graphics.drawRect(0, 0, _local_5.width, _local_5.height);
            _local_5.draw(_local_6);
            _local_3.x = (k._Str_8780 - _local_4);
            _local_3.bitmap = _local_5;
        }
    }
}

