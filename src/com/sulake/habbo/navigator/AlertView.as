package com.sulake.habbo.navigator
{
    import com.sulake.core.runtime.IDisposable;
    import flash.utils.Dictionary;
    import com.sulake.core.window.components.IFrameWindow;
    import com.sulake.core.window.IWindow;
    import flash.geom.Rectangle;
    import com.sulake.core.window.events.WindowMouseEvent;

    public class AlertView implements IDisposable 
    {
        private static var _Str_4602:Dictionary = new Dictionary();

        private var _navigator:IHabboTransitionalNavigator;
        protected var _Str_4389:IFrameWindow;
        protected var _Str_4188:String;
        protected var _Str_2495:String;
        protected var _disposed:Boolean;

        public function AlertView(k:IHabboTransitionalNavigator, _arg_2:String, _arg_3:String=null)
        {
            this._navigator = k;
            this._Str_4188 = _arg_2;
            this._Str_2495 = _arg_3;
        }

        public static function _Str_22232(k:IWindow):AlertView
        {
            var _local_2:AlertView;
            if (_Str_4602 != null)
            {
                for each (_local_2 in _Str_4602)
                {
                    if (_local_2._Str_4389 == k)
                    {
                        return _local_2;
                    }
                }
            }
            return null;
        }


        public function show():void
        {
            var k:AlertView = (_Str_4602[this._Str_4188] as AlertView);
            if (k != null)
            {
                k.dispose();
            }
            this._Str_4389 = this._Str_24090();
            if (this._Str_2495 != null)
            {
                this._Str_4389.caption = this._Str_2495;
            }
            this.setupAlertWindow(this._Str_4389);
            var _local_2:Rectangle = Util._Str_10228(this._Str_4389.desktop, this._Str_4389.width, this._Str_4389.height);
            this._Str_4389.x = _local_2.x;
            this._Str_4389.y = _local_2.y;
            _Str_4602[this._Str_4188] = this;
            this._Str_4389.activate();
        }

        public function dispose():void
        {
            if (this._disposed)
            {
                return;
            }
            if (_Str_4602[this._Str_4188] == this)
            {
                _Str_4602[this._Str_4188] = null;
            }
            this._disposed = true;
            if (this._Str_4389 != null)
            {
                this._Str_4389.destroy();
                this._Str_4389 = null;
            }
            this._navigator = null;
        }

        internal function setupAlertWindow(k:IFrameWindow):void
        {
        }

        internal function onCloseHandler(k:WindowMouseEvent):void
        {
            this.dispose();
        }

        private function _Str_24090():IFrameWindow
        {
            var k:IFrameWindow = (this._navigator.getXmlWindow(this._Str_4188, 2) as IFrameWindow);
            var _local_2:IWindow = k.findChildByTag("close");
            if (_local_2 != null)
            {
                _local_2.addEventListener(WindowMouseEvent.CLICK, this.onCloseHandler);
            }
            return k;
        }

        public function get disposed():Boolean
        {
            return this._disposed;
        }

        public function get navigator():IHabboTransitionalNavigator
        {
            return this._navigator;
        }
    }
}
