package com.sulake.core.window.components
{
    import com.sulake.core.window.WindowController;
    import com.sulake.core.window.enum.WindowParam;
    import flash.geom.Rectangle;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.window.WindowContext;
    import com.sulake.core.window.graphics.IGraphicContext;
    import com.sulake.core.window.events.WindowEvent;
    import __AS3__.vec.*;

    public class SubstituteParentController extends WindowController 
    {
        public function SubstituteParentController(k:WindowContext)
        {
            super("_CONTEXT_SUBSTITUTE_PARENT", 0, 0, WindowParam.WINDOW_PARAM_USE_PARENT_GRAPHIC_CONTEXT, k, new Rectangle(0, 0, 2000, 2000), null, null, null, null, 0);
            _Str_2187 = new Vector.<IWindow>();
            _Str_3781 = false;
        }

        override public function getGraphicContext(k:Boolean):IGraphicContext
        {
            return null;
        }

        override public function setupGraphicsContext():IGraphicContext
        {
            return null;
        }

        private function _Str_25902(k:WindowEvent):void
        {
            var _local_2:IWindow = k.window;
            if (getChildIndex(_local_2) != -1)
            {
                if (!_local_2.testParamFlag(WindowParam.WINDOW_PARAM_USE_PARENT_GRAPHIC_CONTEXT))
                {
                    _local_2.desktop.addChild(_local_2);
                }
            }
        }

        override public function addChild(k:IWindow):IWindow
        {
            _Str_2187.push(k);
            return k;
        }

        override public function addChildAt(k:IWindow, _arg_2:int):IWindow
        {
            var _local_3:WindowController = WindowController(k);
            if (_local_3.parent != null)
            {
                WindowController(_local_3.parent).removeChild(_local_3);
            }
            _Str_2187.splice(_arg_2, 0, k);
            _local_3.parent = this;
            return k;
        }

        override public function getChildAt(k:int):IWindow
        {
            return (_Str_2187) ? ((k < _Str_2187.length) ? _Str_2187[k] : null) : null;
        }

        override public function getChildByID(k:int):IWindow
        {
            var _local_2:IWindow;
            if (_Str_2187)
            {
                for each (_local_2 in _Str_2187)
                {
                    if (_local_2.id == k)
                    {
                        return _local_2;
                    }
                }
            }
            return null;
        }

        override public function getChildByName(k:String):IWindow
        {
            var _local_2:IWindow;
            if (_Str_2187)
            {
                for each (_local_2 in _Str_2187)
                {
                    if (_local_2.name == k)
                    {
                        return _local_2;
                    }
                }
            }
            return null;
        }

        override public function findChildByName(k:String):IWindow
        {
            var _local_2:WindowController;
            if (_Str_2187)
            {
                for each (_local_2 in _Str_2187)
                {
                    if (_local_2.name == k)
                    {
                        return _local_2;
                    }
                }
                for each (_local_2 in _Str_2187)
                {
                    _local_2 = (_local_2.findChildByName(k) as WindowController);
                    if (_local_2)
                    {
                        return _local_2 as IWindow;
                    }
                }
            }
            return null;
        }

        override public function removeChild(k:IWindow):IWindow
        {
            var _local_2:int = _Str_2187.indexOf(k);
            if (_local_2 > -1)
            {
                _Str_2187.splice(_local_2, 1);
                k.parent = null;
                return k;
            }
            return null;
        }

        override public function setChildIndex(k:IWindow, _arg_2:int):void
        {
            var _local_3:int = _Str_2187.indexOf(k);
            if (((_local_3 > -1) && (!(_arg_2 == _local_3))))
            {
                _Str_2187.splice(_local_3, 1);
                _Str_2187.splice(_arg_2, 0, k);
            }
        }

        override public function swapChildren(k:IWindow, _arg_2:IWindow):void
        {
            var _local_3:int;
            var _local_4:int;
            var _local_5:IWindow;
            var _local_6:int;
            if ((((!(k == null)) && (!(_arg_2 == null))) && (!(k == _arg_2))))
            {
                _local_3 = _Str_2187.indexOf(k);
                if (_local_3 < 0)
                {
                    return;
                }
                _local_4 = _Str_2187.indexOf(_arg_2);
                if (_local_4 < 0)
                {
                    return;
                }
                if (_local_4 < _local_3)
                {
                    _local_5 = k;
                    k = _arg_2;
                    _arg_2 = _local_5;
                    _local_6 = _local_3;
                    _local_3 = _local_4;
                    _local_4 = _local_6;
                }
                _Str_2187.splice(_local_4, 1);
                _Str_2187.splice(_local_3, 1);
                _Str_2187.splice(_local_3, 0, _arg_2);
                _Str_2187.splice(_local_4, 0, k);
            }
        }

        override public function swapChildrenAt(k:int, _arg_2:int):void
        {
            this.swapChildren(_Str_2187[k], _Str_2187[_arg_2]);
        }
    }
}
