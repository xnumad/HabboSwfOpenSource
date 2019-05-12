package com.sulake.habbo.friendbar.landingview.layout.backgroundobjects
{
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.core.runtime.IUpdateReceiver;
    import com.sulake.core.window.IWindow;
    import flash.events.EventDispatcher;
    import com.sulake.core.window.components.IStaticBitmapWrapperWindow;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.habbo.friendbar.landingview.HabboLandingView;

    public class _Str_3317 implements IDisposable, IUpdateReceiver 
    {
        private var _id:int;
        private var _window:IWindow;
        private var _events:EventDispatcher;
        private var _sprite:IStaticBitmapWrapperWindow;

        public function _Str_3317(k:int, _arg_2:IWindowContainer, _arg_3:EventDispatcher, _arg_4:HabboLandingView, _arg_5:String, _arg_6:Boolean=false)
        {
            this._id = k;
            this._window = _arg_2;
            this._events = _arg_3;
            if (_arg_6)
            {
                this._sprite = IStaticBitmapWrapperWindow(_arg_4.getXmlWindow("moving_object"));
            }
            else
            {
                this._sprite = IStaticBitmapWrapperWindow(_arg_4.getXmlWindow("moving_object_floating"));
            }
            _arg_2.addChild(this._sprite);
        }

        public function dispose():void
        {
            this._window = null;
            this._sprite = null;
        }

        public function get disposed():Boolean
        {
            return this._window == null;
        }

        public function set sprite(k:IStaticBitmapWrapperWindow):void
        {
            this._sprite = k;
        }

        public function get sprite():IStaticBitmapWrapperWindow
        {
            return this._sprite;
        }

        public function get window():IWindow
        {
            return this._window;
        }

        public function set window(k:IWindow):void
        {
            this._window = k;
        }

        public function get events():EventDispatcher
        {
            return this._events;
        }

        public function get id():int
        {
            return this._id;
        }

        public function update(k:uint):void
        {
            if (!this._sprite)
            {
                return;
            }
        }
    }
}
