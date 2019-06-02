package com.sulake.habbo.navigator
{
    import flash.geom.Rectangle;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.core.window.enum.WindowParam;
    import com.sulake.core.window.components.ITextWindow;
    import flash.geom.Point;

    public class Util 
    {
        private static var _Str_14049:CutToWidth = new CutToWidth();
        private static var _Str_21089:CutToHeight = new CutToHeight();


        public static function remove(k:Array, _arg_2:Object):int
        {
            var _local_3:int = k.indexOf(_arg_2);
            if (_local_3 >= 0)
            {
                k.splice(_local_3, 1);
            }
            return _local_3;
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

        public static function _Str_13639(k:IWindowContainer):Boolean
        {
            var _local_3:IWindow;
            var _local_2:int;
            while (_local_2 < k.numChildren)
            {
                _local_3 = k.getChildAt(_local_2);
                if (_local_3.visible)
                {
                    return true;
                }
                _local_2++;
            }
            return false;
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

        public static function _Str_5055(k:IWindowContainer, _arg_2:Array, _arg_3:int, _arg_4:int, _arg_5:int):void
        {
            var _local_6:String;
            var _local_7:IWindow;
            for each (_local_6 in _arg_2)
            {
                _local_7 = k.getChildByName(_local_6);
                if (((!(_local_7 == null)) && (_local_7.visible)))
                {
                    _local_7.x = _arg_3;
                    _local_7.y = _arg_4;
                    _arg_3 = (_arg_3 + (_local_7.width + _arg_5));
                }
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

        public static function _Str_7173(k:IWindowContainer, _arg_2:int, _arg_3:int, _arg_4:int=0, _arg_5:int=0):void
        {
            var _local_9:IWindow;
            var _local_6:int = _arg_5;
            var _local_7:int;
            var _local_8:int;
            while (_local_8 < k.numChildren)
            {
                _local_9 = k.getChildAt(_local_8);
                if (!_local_9.visible)
                {
                }
                else
                {
                    if (((_local_6 > 0) && ((_local_6 + _local_9.width) > _arg_2)))
                    {
                        _local_6 = 0;
                        _local_7 = (_local_7 + _arg_3);
                    }
                    _local_9.x = _local_6;
                    _local_9.y = _local_7;
                    _local_6 = (_local_6 + (_local_9.width + _arg_4));
                }
                _local_8++;
            }
        }

        public static function _Str_3931(k:IWindowContainer, _arg_2:String, _arg_3:Function):void
        {
            var _local_4:IWindow = k.findChildByName(_arg_2);
            _local_4.setParamFlag(WindowParam.WINDOW_PARAM_INPUT_EVENT_PROCESSOR, true);
            _local_4.procedure = _arg_3;
        }

        public static function _Str_6937(k:IWindow, _arg_2:Function):void
        {
            k.setParamFlag(WindowParam.WINDOW_PARAM_INPUT_EVENT_PROCESSOR, true);
            k.procedure = _arg_2;
        }

        public static function trim(k:String):String
        {
            if (((k == null) || (k.length < 1)))
            {
                return k;
            }
            while (k.charAt(0) == " ")
            {
                k = k.substring(1);
            }
            while (k.charAt((k.length - 1)) == " ")
            {
                k = k.substring(0, (k.length - 1));
            }
            return k;
        }

        public static function _Str_21212(k:ITextWindow, _arg_2:String, _arg_3:int):void
        {
            k.text = _arg_2;
            if (k.textWidth <= _arg_3)
            {
                return;
            }
            _Str_14049._Str_20578(_arg_2, k, _arg_3);
            _Str_21557(_Str_14049, (_arg_2.length - 1));
        }

        public static function _Str_21557(k:BinarySearchTest, _arg_2:int):void
        {
            var _local_5:int;
            var _local_6:Boolean;
            var _local_3:int;
            var _local_4:int;
            while (true)
            {
                if (_local_3 >= _arg_2)
                {
                    k.test(_local_4);
                    return;
                }
                _local_5 = (_local_3 + Math.floor(((_arg_2 - _local_3) / 2)));
                _local_6 = k.test(_local_5);
                if (_local_6)
                {
                    _arg_2 = (_local_5 - 1);
                }
                else
                {
                    _local_4 = Math.max(_local_4, _local_5);
                    _local_3 = (_local_5 + 1);
                }
            }
        }

        public static function _Str_21690(k:IWindow):Boolean
        {
            var _local_2:Point = new Point();
            k.getRelativeMousePosition(_local_2);
            var _local_3:Boolean = ((((_local_2.x >= 0) && (_local_2.y >= 0)) && (_local_2.x < k.width)) && (_local_2.y < k.height));
            return _local_3;
        }
    }
}
