package com.sulake.habbo.navigator.roomsettings
{
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.core.window.components.IFrameWindow;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.habbo.navigator.Util;
    import flash.geom.Rectangle;
    import com.sulake.habbo.navigator.IHabboTransitionalNavigator;

    public class ConfirmDialogView implements IDisposable 
    {
        private var _window:IFrameWindow;
        private var _okHandler:Function;

        public function ConfirmDialogView(k:IHabboTransitionalNavigator, _arg_2:Function, _arg_3:String, _arg_4:String)
        {
            this._window = IFrameWindow(k.getXmlWindow("ros_confirm"));
            this._okHandler = _arg_2;
            this._window.findChildByTag("close").addEventListener(WindowMouseEvent.CLICK, this._Str_26455);
            this._window.findChildByName("ok").addEventListener(WindowMouseEvent.CLICK, this._Str_6167);
            this._window.caption = _arg_3;
            this._window.findChildByName("message").caption = _arg_4;
            var _local_5:Rectangle = Util._Str_10228(this._window.desktop, this._window.width, this._window.height);
            this._window.x = _local_5.x;
            this._window.y = _local_5.y;
            this._window.visible = true;
            this._window.activate();
        }

        private function _Str_26455(k:WindowMouseEvent):void
        {
            this.dispose();
        }

        private function _Str_6167(k:WindowMouseEvent):void
        {
            this._okHandler.apply();
            this.dispose();
        }

        public function dispose():void
        {
            if (this._window != null)
            {
                this._window.destroy();
                this._window = null;
            }
            this._okHandler = null;
        }

        public function get disposed():Boolean
        {
            return this._window == null;
        }
    }
}
