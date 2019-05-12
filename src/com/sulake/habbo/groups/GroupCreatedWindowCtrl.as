package com.sulake.habbo.groups
{
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.core.window.components.IFrameWindow;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.habbo.communication.messages.outgoing.users._Str_2863;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.core.window.IWindow;

    public class GroupCreatedWindowCtrl implements IDisposable 
    {
        private var _manager:HabboGroupsManager;
        private var _window:IFrameWindow;
        private var _groupId:int;

        public function GroupCreatedWindowCtrl(k:HabboGroupsManager)
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

        public function show(k:int):void
        {
            this._groupId = k;
            this._Str_2755();
            this._window.visible = true;
            this._window.activate();
        }

        private function _Str_2755():void
        {
            if (this._window != null)
            {
                return;
            }
            this._window = IFrameWindow(this._manager.getXmlWindow("group_created_window"));
            this._window.findChildByTag("close").procedure = this._Str_2392;
            this._window.findChildByName("ok_button").procedure = this._Str_2392;
            this._window.center();
        }

        private function _Str_2392(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type == WindowMouseEvent.CLICK)
            {
                this.close();
                this._manager.send(new _Str_2863(this._groupId, false));
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
