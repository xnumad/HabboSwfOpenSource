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
        protected static const _Str_15557:int = 55;
        protected static const _Str_10400:int = -5;
        protected static const _Str_7674:int = 100;

        protected var _window:IWindowContainer;
        protected var _Str_2268:RoomToolsWidget;
        protected var _Str_2277:IHabboWindowManager;
        protected var _assets:IAssetLibrary;
        protected var _Str_3510:Boolean = true;
        protected var _Str_5637:Timer;
        protected var _Str_13353:Boolean;
        protected var _Str_20667:int;

        public function RoomToolsCtrlBase(k:RoomToolsWidget, _arg_2:IHabboWindowManager, _arg_3:IAssetLibrary)
        {
            this._Str_2268 = k;
            this._Str_2277 = _arg_2;
            this._assets = _arg_3;
            this._Str_20667 = this.handler.container.config.getInteger("room.enter.info.collapse.delay", 5000);
        }

        public function dispose():void
        {
            if (this._window)
            {
                this._window.procedure = null;
                this._window.dispose();
                this._window = null;
            }
            if (this._Str_5637)
            {
                this._Str_5637.reset();
                this._Str_5637 = null;
                this._Str_13353 = false;
            }
            this._Str_2268 = null;
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
            this._Str_5637 = new Timer(this._Str_20667, 1);
            this._Str_5637.addEventListener(TimerEvent.TIMER, this._Str_22422);
            this._Str_5637.start();
        }

        protected function _Str_20157():void
        {
            if (this._Str_13353)
            {
                this._Str_18018();
            }
        }

        protected function _Str_10524():void
        {
            if (this._Str_5637 != null)
            {
                this._Str_5637.reset();
                this._Str_5637 = null;
            }
            this._Str_13353 = false;
        }

        private function _Str_22422(k:TimerEvent):void
        {
            this._Str_10524();
            this.setCollapsed(true);
        }

        protected function _Str_21734():void
        {
            if (this._Str_5637 != null)
            {
                this._Str_10524();
                this._Str_13353 = true;
            }
        }

        public function setCollapsed(k:Boolean):void
        {
        }

        public function get _Str_25900():Boolean
        {
            return this._Str_3510;
        }

        public function get window():IWindowContainer
        {
            return this._window;
        }

        public function get handler():RoomToolsWidgetHandler
        {
            return (this._Str_2268) ? this._Str_2268.handler : null;
        }
    }
}
