package com.sulake.habbo.ui.widget
{
    import com.sulake.core.runtime.events.EventDispatcherWrapper;
    import com.sulake.habbo.window.IHabboWindowManager;
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.habbo.localization.IHabboLocalizationManager;
    import com.sulake.habbo.ui.IRoomWidgetHandler;
    import flash.events.IEventDispatcher;
    import com.sulake.core.window.IWindow;

    public class RoomWidgetBase implements IRoomWidget
    {
        private var _disposed:Boolean = false;
        private var _events:EventDispatcherWrapper;
        private var _messageListener:IRoomWidgetMessageListener;
        private var _windowManager:IHabboWindowManager;
        protected var _assets:IAssetLibrary;
        protected var _localizations:IHabboLocalizationManager;
        protected var _handler:IRoomWidgetHandler;

        public function RoomWidgetBase(k:IRoomWidgetHandler, _arg_2:IHabboWindowManager, _arg_3:IAssetLibrary=null, _arg_4:IHabboLocalizationManager=null)
        {
            this._handler = k;
            this._windowManager = _arg_2;
            this._assets = _arg_3;
            this._localizations = _arg_4;
        }

        public function get state():int
        {
            return 0;
        }

        public function get disposed():Boolean
        {
            return this._disposed;
        }

        public function initialize(k:int=0):void
        {
        }

        public function dispose():void
        {
            if (this.disposed)
            {
                return;
            }
            this._messageListener = null;
            this._windowManager = null;
            if (((!(this._events == null)) && (!(this._events.disposed))))
            {
                this.unregisterUpdateEvents(this._events);
            }
            if (this._handler)
            {
                this._handler.dispose();
                this._handler = null;
            }
            this._events = null;
            this._assets = null;
            this._localizations = null;
            this._disposed = true;
        }

        public function set messageListener(k:IRoomWidgetMessageListener):void
        {
            this._messageListener = k;
        }

        public function get messageListener():IRoomWidgetMessageListener
        {
            return this._messageListener;
        }

        public function get windowManager():IHabboWindowManager
        {
            return this._windowManager;
        }

        public function get assets():IAssetLibrary
        {
            return this._assets;
        }

        public function get localizations():IHabboLocalizationManager
        {
            return this._localizations;
        }

        public function registerUpdateEvents(k:IEventDispatcher):void
        {
            if ((k is EventDispatcherWrapper))
            {
                this._events = (k as EventDispatcherWrapper);
            }
        }

        public function unregisterUpdateEvents(k:IEventDispatcher):void
        {
        }

        public function get mainWindow():IWindow
        {
            return null;
        }
    }
}
