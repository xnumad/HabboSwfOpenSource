package com.sulake.habbo.roomevents
{
    import com.sulake.core.window.enum.WindowParam;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.window.IWindowContainer;

    public class Util 
    {
        public static function _Str_6937(k:IWindow, _arg_2:Function):void
        {
            k.setParamFlag(WindowParam.WINDOW_PARAM_INPUT_EVENT_PROCESSOR, true);
            k.procedure = _arg_2;
        }

        public static function _Str_2647(k:IWindowContainer):int
        {
            var _local_4:IWindow;
            var _local_2:int;
            var _local_3:int;
            while (_local_3 < k.numChildren)
            {
                _local_4 = k.getChildAt(_local_3);
                if (_local_4.visible)
                {
                    _local_2 = Math.max(_local_2, (_local_4.y + _local_4.height));
                }
                _local_3++;
            }
            return _local_2;
        }

        public static function _Str_2930(k:IWindowContainer):void
        {
            var _local_2:int;
            while (_local_2 < k.numChildren)
            {
                k.getChildAt(_local_2).visible = false;
                _local_2++;
            }
        }

        public static function _Str_21358(k:IWindowContainer):void
        {
            var _local_2:int;
            while (_local_2 < k.numChildren)
            {
                k.getChildAt(_local_2).visible = true;
                _local_2++;
            }
        }

        public static function _Str_4679(k:IWindowContainer, _arg_2:Array, _arg_3:int, _arg_4:int):void
        {
            var _local_5:String;
            var _local_6:IWindow;
            for each (_local_5 in _arg_2)
            {
                _local_6 = k.getChildByName(_local_5);
                if ((((!(_local_6 == null)) && (_local_6.visible)) && (_local_6.height > 0)))
                {
                    _local_6.y = _arg_3;
                    _arg_3 = (_arg_3 + (_local_6.height + _arg_4));
                }
            }
        }

        public static function _Str_14509(k:IWindowContainer, _arg_2:int, _arg_3:int):void
        {
            var _local_4:int;
            var _local_5:IWindow;
            while (_local_4 < k.numChildren)
            {
                _local_5 = k.getChildAt(_local_4);
                if ((((!(_local_5 == null)) && (_local_5.visible)) && (_local_5.height > 0)))
                {
                    _local_5.y = _arg_2;
                    _arg_2 = (_arg_2 + (_local_5.height + _arg_3));
                }
                _local_4++;
            }
        }
    }
}
