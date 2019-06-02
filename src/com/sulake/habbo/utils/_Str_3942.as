package com.sulake.habbo.utils
{
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.window.components.IDesktopWindow;
    import flash.geom.Rectangle;
    import com.sulake.core.window.enum.WindowState;

    public class _Str_3942 implements IDisposable 
    {
        public static const _Str_22156:int = 0;
        public static const _Str_22144:int = 1;
        public static const _Str_20404:int = 2;

        private var _window:IWindow;
        private var _Str_4242:IDesktopWindow;
        private var _disposed:Boolean;
        private var _Str_14954:Function;
        private var _Str_8663:Function;

        public function _Str_3942(k:IWindow, _arg_2:IDesktopWindow, _arg_3:Function=null, _arg_4:Function=null)
        {
            this._window = k;
            this._Str_4242 = _arg_2;
            this._Str_14954 = _arg_3;
            this._Str_8663 = _arg_4;
        }

        public static function _Str_9211(k:IWindow):Boolean
        {
            var _local_7:IWindow;
            var _local_2:IDesktopWindow = k.desktop;
            var _local_3:int = _local_2.numChildren;
            var _local_4:int = _local_2.getChildIndex(k);
            if (_local_4 < 0)
            {
                throw (new Error("Window must be contained by the desktop!"));
            }
            var _local_5:Rectangle = new Rectangle();
            k.getGlobalRectangle(_local_5);
            var _local_6:Rectangle = new Rectangle();
            var _local_8:int = (_local_4 + 1);
            while (_local_8 < _local_3)
            {
                _local_7 = _local_2.getChildAt(_local_8);
                if (_local_7.visible)
                {
                    _local_7.getGlobalRectangle(_local_6);
                    if (_local_5.intersects(_local_6))
                    {
                        return true;
                    }
                }
                _local_8++;
            }
            return false;
        }


        public function get window():IWindow
        {
            return this._window;
        }

        public function get visible():Boolean
        {
            return ((this._window) && (this._window.visible)) && (this._window.parent);
        }

        public function get active():Boolean
        {
            return (this.visible) && (this._window.getStateFlag(WindowState.ACTIVE));
        }

        public function get disposed():Boolean
        {
            return this._disposed;
        }

        public function dispose():void
        {
            if (!this._disposed)
            {
                if (this._window)
                {
                    this._window.dispose();
                    this._window = null;
                }
                this._Str_4242 = null;
                this._disposed = true;
                this._Str_14954 = null;
                this._Str_8663 = null;
            }
        }

        public function show():void
        {
            if (!this._window.disposed)
            {
                if (this._window.parent != this._Str_4242)
                {
                    this._Str_4242.addChild(this._window);
                }
                if (!this._window.visible)
                {
                    this._window.visible = true;
                }
                this._window.activate();
            }
        }

        public function hide():void
        {
            if (!this._window.disposed)
            {
                if (this._window.parent == this._Str_4242)
                {
                    this._Str_4242.removeChild(this._window);
                }
                if (this._window.visible)
                {
                    this._window.visible = false;
                }
                this._window.deactivate();
            }
        }

        public function toggle():void
        {
            if (this.visible)
            {
                if (this.active)
                {
                    if ((this._Str_8663 == null))
                    {
                        this.hide();
                    }
                    else
                    {
                        this._Str_8663.call();
                    }
                }
                else
                {
                    if (_Str_9211(this._window))
                    {
                        this._window.activate();
                    }
                    else
                    {
                        if ((this._Str_8663 == null))
                        {
                            this.hide();
                        }
                        else
                        {
                            this._Str_8663.call();
                        }
                    }
                }
            }
            else
            {
                if ((this._Str_14954 == null))
                {
                    this.show();
                }
                else
                {
                    this._Str_14954.call();
                }
            }
        }
    }
}
