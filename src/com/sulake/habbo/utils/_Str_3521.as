package com.sulake.habbo.utils
{
    import com.sulake.core.window.IWindow;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.core.window.components.IRegionWindow;
    import com.sulake.core.window.events.WindowEvent;

    public class _Str_3521 
    {


        public static function setup(k:IWindowContainer, _arg_2:Function):void
        {
            var _local_3:IWindow = k.findChildByName("user_info_region");
            _local_3.addEventListener(WindowMouseEvent.OVER, _Str_22763);
            _local_3.addEventListener(WindowMouseEvent.OUT, _Str_25615);
            _local_3.addEventListener(WindowMouseEvent.CLICK, _arg_2);
        }

        private static function _Str_22763(k:WindowEvent):void
        {
            var _local_2:IRegionWindow = IRegionWindow(k.target);
            _Str_3927(true, _local_2);
        }

        private static function _Str_25615(k:WindowEvent):void
        {
            var _local_2:IRegionWindow = IRegionWindow(k.target);
            _Str_3927(false, _local_2);
        }

        public static function _Str_3927(k:Boolean, _arg_2:IWindowContainer):void
        {
            _arg_2.findChildByName("icon_eye_off").visible = (!(k));
            _arg_2.findChildByName("icon_eye_over").visible = k;
        }

        public static function _Str_6514(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type == WindowMouseEvent.OVER)
            {
                _Str_3521._Str_3927(true, IWindowContainer(_arg_2.parent));
            }
            else
            {
                if (k.type == WindowMouseEvent.OUT)
                {
                    _Str_3521._Str_3927(false, IWindowContainer(_arg_2.parent));
                }
            }
        }
    }
}
