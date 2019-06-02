package com.sulake.habbo.friendlist
{
    import com.sulake.core.window.IWindow;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.core.window.enum.WindowParam;
    import flash.geom.Rectangle;

    public class Util 
    {


        public static function remove(k:Array, _arg_2:Object):void
        {
            var _local_3:int = k.indexOf(_arg_2);
            if (_local_3 >= 0)
            {
                k.splice(_local_3, 1);
            }
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

        public static function _Str_25993(k:IWindowContainer):int
        {
            var _local_4:IWindow;
            var _local_2:int;
            var _local_3:int;
            while (_local_3 < k.numChildren)
            {
                _local_4 = k.getChildAt(_local_3);
                if (_local_4.visible)
                {
                    _local_2 = Math.max(_local_2, (_local_4.x + _local_4.width));
                }
                _local_3++;
            }
            return _local_2;
        }

        public static function arrayToString(k:Array, _arg_2:String=", ", _arg_3:String=""):String
        {
            var _local_5:Object;
            var _local_4:String = "";
            for each (_local_5 in k)
            {
                if (_local_4 != "")
                {
                    _local_4 = (_local_4 + _arg_2);
                }
                _local_4 = (_local_4 + ((_arg_3 + _local_5) + _arg_3));
            }
            return _local_4;
        }

        public static function _Str_21849(k:String, _arg_2:IWindow):void
        {
            var _local_4:int;
            Logger.log((((((((k + _arg_2) + " (") + _arg_2.width) + ", ") + _arg_2.height) + "), ") + _arg_2.getParamFlag(WindowParam.WINDOW_PARAM_USE_PARENT_GRAPHIC_CONTEXT)));
            var _local_3:IWindowContainer = (_arg_2 as IWindowContainer);
            if (_local_3 != null)
            {
                _local_4 = 0;
                while (_local_4 < _local_3.numChildren)
                {
                    _Str_21849((k + "-"), _local_3.getChildAt(_local_4));
                    _local_4++;
                }
            }
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

        public static function _Str_10228(k:IWindow, _arg_2:int, _arg_3:int):Rectangle
        {
            if (k == null)
            {
                return new Rectangle(300, 200, _arg_2, _arg_3);
            }
            var _local_4:int = (k.width - _arg_2);
            var _local_5:int = (k.height - _arg_3);
            return new Rectangle((k.x + (0.5 * _local_4)), (k.y + (0.5 * _local_5)), _arg_2, _arg_3);
        }

        public static function _Str_7173(k:IWindowContainer, _arg_2:int, _arg_3:int):void
        {
            var _local_7:IWindow;
            var _local_4:int;
            var _local_5:int;
            var _local_6:int;
            while (_local_6 < k.numChildren)
            {
                _local_7 = k.getChildAt(_local_6);
                if (!_local_7.visible)
                {
                }
                else
                {
                    if (((_local_4 > 0) && ((_local_4 + _local_7.width) > _arg_2)))
                    {
                        _local_4 = 0;
                        _local_5 = (_local_5 + _arg_3);
                    }
                    _local_7.x = _local_4;
                    _local_7.y = _local_5;
                    _local_4 = (_local_4 + _local_7.width);
                }
                _local_6++;
            }
        }
    }
}
