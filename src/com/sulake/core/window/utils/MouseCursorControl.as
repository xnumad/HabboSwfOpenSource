package com.sulake.core.window.utils
{
    import com.sulake.core.window.enum.MouseCursorType;
    import flash.display.Stage;
    import flash.display.DisplayObject;
    import flash.utils.Dictionary;
    import flash.events.Event;
    import flash.events.MouseEvent;
    import flash.ui.Mouse;
    import flash.ui.MouseCursor;

    public class MouseCursorControl 
    {
        private static var _type:uint = MouseCursorType.DEFAULT;
        private static var _Str_2691:Stage;
        private static var _Str_2500:Boolean = true;
        private static var _disposed:Boolean = false;
        private static var _Str_7147:Boolean = true;
        private static var _Str_3522:DisplayObject;
        private static var _Str_13973:Dictionary = new Dictionary();

        public function MouseCursorControl(k:DisplayObject)
        {
            _Str_2691 = k.stage;
        }

        public static function dispose():void
        {
            if (!_disposed)
            {
                if (_Str_3522)
                {
                    _Str_2691.removeChild(_Str_3522);
                    _Str_2691.removeEventListener(Event.MOUSE_LEAVE, _Str_16609);
                    _Str_2691.removeEventListener(MouseEvent.MOUSE_MOVE, _Str_3983);
                    _Str_2691.removeEventListener(MouseEvent.MOUSE_OVER, _Str_3983);
                    _Str_2691.removeEventListener(MouseEvent.MOUSE_OUT, _Str_3983);
                }
                _disposed = true;
            }
        }

        public static function get disposed():Boolean
        {
            return _disposed;
        }

        public static function get type():uint
        {
            return _type;
        }

        public static function set type(k:uint):void
        {
            if (_type != k)
            {
                _type = k;
                _Str_7147 = true;
            }
        }

        public static function get visible():Boolean
        {
            return _Str_2500;
        }

        public static function set visible(k:Boolean):void
        {
            _Str_2500 = k;
            if (_Str_2500)
            {
                if (_Str_3522)
                {
                    _Str_3522.visible = true;
                }
                else
                {
                    Mouse.show();
                }
            }
            else
            {
                if (_Str_3522)
                {
                    _Str_3522.visible = false;
                }
                else
                {
                    Mouse.hide();
                }
            }
        }

        public static function change():void
        {
            var k:DisplayObject;
            if (_Str_7147)
            {
                k = _Str_13973[_type];
                if (k)
                {
                    if (_Str_3522)
                    {
                        _Str_2691.removeChild(_Str_3522);
                    }
                    else
                    {
                        _Str_2691.addEventListener(Event.MOUSE_LEAVE, _Str_16609);
                        _Str_2691.addEventListener(MouseEvent.MOUSE_MOVE, _Str_3983);
                        _Str_2691.addEventListener(MouseEvent.MOUSE_OVER, _Str_3983);
                        _Str_2691.addEventListener(MouseEvent.MOUSE_OUT, _Str_3983);
                        Mouse.hide();
                    }
                    _Str_3522 = k;
                    _Str_2691.addChild(_Str_3522);
                }
                else
                {
                    if (_Str_3522)
                    {
                        _Str_2691.removeChild(_Str_3522);
                        _Str_2691.removeEventListener(Event.MOUSE_LEAVE, _Str_16609);
                        _Str_2691.removeEventListener(MouseEvent.MOUSE_MOVE, _Str_3983);
                        _Str_2691.removeEventListener(MouseEvent.MOUSE_OVER, _Str_3983);
                        _Str_2691.removeEventListener(MouseEvent.MOUSE_OUT, _Str_3983);
                        _Str_3522 = null;
                        Mouse.show();
                    }
                    switch (_type)
                    {
                        case MouseCursorType.DEFAULT:
                        case MouseCursorType.ARROW:
                            Mouse.cursor = MouseCursor.AUTO;
                            break;
                        case MouseCursorType.ARROW_LINK:
                            Mouse.cursor = MouseCursor.BUTTON;
                            break;
                        case MouseCursorType.DRAG:
                        case MouseCursorType.MOVE:
                        case MouseCursorType.MOVE_VERTICAL:
                        case MouseCursorType.MOVE_HORIZONTAL:
                            Mouse.cursor = MouseCursor.HAND;
                            break;
                        case MouseCursorType.NONE:
                            Mouse.cursor = MouseCursor.AUTO;
                            Mouse.hide();
                            break;
                    }
                }
                _Str_7147 = false;
            }
        }

        public static function _Str_26277(k:uint, _arg_2:DisplayObject):void
        {
            _Str_13973[k] = _arg_2;
        }

        private static function _Str_3983(k:MouseEvent):void
        {
            if (_Str_3522)
            {
                _Str_3522.x = (k.stageX - 2);
                _Str_3522.y = k.stageY;
                if (_type == MouseCursorType.DEFAULT)
                {
                    _Str_2500 = false;
                    Mouse.show();
                }
                else
                {
                    _Str_2500 = true;
                    Mouse.hide();
                }
            }
        }

        private static function _Str_16609(k:Event):void
        {
            if (((_Str_3522) && (!(_type == MouseCursorType.DEFAULT))))
            {
                Mouse.hide();
                _Str_2500 = false;
            }
        }
    }
}
