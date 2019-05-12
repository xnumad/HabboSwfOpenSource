package com.sulake.habbo.utils
{
    import flash.text.StyleSheet;
    import com.sulake.core.window.components.ITextWindow;

    public class TextWindowUtils 
    {


        public static function _Str_20340(k:ITextWindow, _arg_2:uint, _arg_3:uint, _arg_4:uint, _arg_5:Boolean=true):void
        {
            if (!k)
            {
                return;
            }
            var _local_6:StyleSheet = new StyleSheet();
            var _local_7:Object = new Object();
            _local_7.color = _Str_5520(_arg_2);
            var _local_8:Object = new Object();
            if (_arg_5)
            {
                _local_8.textDecoration = "underline";
            }
            _local_8.color = _Str_5520(_arg_3);
            var _local_9:Object = new Object();
            _local_9.color = _Str_5520(_arg_4);
            var _local_10:Object = new Object();
            _local_10.textDecoration = "underline";
            _local_6.setStyle("a:link", _local_8);
            _local_6.setStyle("a:hover", _local_7);
            _local_6.setStyle("a:active", _local_9);
            _local_6.setStyle(".visited", _local_10);
            k.styleSheet = _local_6;
        }

        public static function _Str_5520(k:uint):String
        {
            var _local_2:String = k.toString(16);
            while (_local_2.length < 6)
            {
                _local_2 = ("0" + _local_2);
            }
            return "#" + _local_2;
        }
    }
}
