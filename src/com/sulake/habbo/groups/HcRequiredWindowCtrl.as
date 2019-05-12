package com.sulake.habbo.groups
{
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.core.window.components.IFrameWindow;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.core.window.IWindow;

    public class HcRequiredWindowCtrl implements IDisposable 
    {
        private var _manager:HabboGroupsManager;
        private var _window:IFrameWindow;

        public function HcRequiredWindowCtrl(k:HabboGroupsManager)
        {
            this._manager = k;
        }

        public function dispose():void
        {
            this._manager = null;
            if (this._window)
            {
                this._window.dispose();
                this._window = null;
            }
        }

        public function get disposed():Boolean
        {
            return this._manager == null;
        }

        public function show(k:Boolean):void
        {
            this._Str_2755();
            this._window.findChildByName("info_txt").caption = ((k) ? "${group.hcrequired.info.manage}" : "${group.hcrequired.info.join}");
            this._window.visible = true;
            this._window.activate();
        }

        private function _Str_2755():void
        {
            if (this._window != null)
            {
                return;
            }
            this._window = IFrameWindow(this._manager.getXmlWindow("club_required"));
            this._window.findChildByTag("close").procedure = this._Str_2392;
            this._window.findChildByName("cancel_link_region").procedure = this._Str_2392;
            this._window.findChildByName("join_button").procedure = this._Str_19126;
            this._window.findChildByName("more_info_link_region").procedure = this._Str_19126;
            this._window.center();
        }

        private function _Str_2392(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type == WindowMouseEvent.CLICK)
            {
                this.close();
            }
        }

        private function _Str_19126(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type == WindowMouseEvent.CLICK)
            {
                this._manager._Str_21441("HcRequiredWindowCtrl");
                this.close();
            }
        }

        public function close():void
        {
            if (this._window != null)
            {
                this._window.visible = false;
            }
        }
    }
}
