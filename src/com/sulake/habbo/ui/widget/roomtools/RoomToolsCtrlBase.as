package com.sulake.habbo.ui.widget.roomtools
{
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.habbo.window.IHabboWindowManager;
    import com.sulake.core.assets.IAssetLibrary;
    import flash.utils.Timer;
    import flash.events.TimerEvent;
    import com.sulake.habbo.ui.handler.RoomToolsWidgetHandler;

    public class RoomToolsCtrlBase 
    {
        protected static const DISTANCE_FROM_BOTTOM:int = 55;
        protected static const TOOLBAR_X:int = -5;
        protected static const WINDOW_ANIM_SPEED:int = 100;

        protected var _window:IWindowContainer;
        protected var _widget:RoomToolsWidget;
        protected var _windowManager:IHabboWindowManager;
        protected var _assets:IAssetLibrary;
        protected var _isCollapsed:Boolean = true;
        protected var _windowCollapseTimer:Timer;
        protected var _windowCollapsePending:Boolean;
        protected var _windowCollapseDelay:int;

        public function RoomToolsCtrlBase(k:RoomToolsWidget, _arg_2:IHabboWindowManager, _arg_3:IAssetLibrary)
        {
            this._widget = k;
            this._windowManager = _arg_2;
            this._assets = _arg_3;
            this._windowCollapseDelay = this.handler.container.config.getInteger("room.enter.info.collapse.delay", 5000);
        }

        public function dispose():void
        {
            if (this._window)
            {
                this._window.procedure = null;
                this._window.dispose();
                this._window = null;
            }
            if (this._windowCollapseTimer)
            {
                this._windowCollapseTimer.reset();
                this._windowCollapseTimer = null;
                this._windowCollapsePending = false;
            }
            this._widget = null;
        }

        public function setElementVisible(k:String, _arg_2:Boolean):void
        {
            if (((!(this._window)) || (!(this._window.findChildByName(k)))))
            {
                return;
            }
            this._window.findChildByName(k).visible = _arg_2;
        }

        protected function _Str_18018():void
        {
            this._Str_10524();
            this._windowCollapseTimer = new Timer(this._windowCollapseDelay, 1);
            this._windowCollapseTimer.addEventListener(TimerEvent.TIMER, this._Str_22422);
            this._windowCollapseTimer.start();
        }

        protected function _Str_20157():void
        {
            if (this._windowCollapsePending)
            {
                this._Str_18018();
            }
        }

        protected function _Str_10524():void
        {
            if (this._windowCollapseTimer != null)
            {
                this._windowCollapseTimer.reset();
                this._windowCollapseTimer = null;
            }
            this._windowCollapsePending = false;
        }

        private function _Str_22422(k:TimerEvent):void
        {
            this._Str_10524();
            this.setCollapsed(true);
        }

        protected function _Str_21734():void
        {
            if (this._windowCollapseTimer != null)
            {
                this._Str_10524();
                this._windowCollapsePending = true;
            }
        }

        public function setCollapsed(k:Boolean):void
        {
        }

        public function get _Str_25900():Boolean
        {
            return this._isCollapsed;
        }

        public function get window():IWindowContainer
        {
            return this._window;
        }

        public function get handler():RoomToolsWidgetHandler
        {
            return (this._widget) ? this._widget.handler : null;
        }
    }
}
