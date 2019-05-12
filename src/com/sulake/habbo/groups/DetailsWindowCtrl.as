package com.sulake.habbo.groups
{
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.core.window.components.IFrameWindow;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.habbo.communication.messages.incoming.users._Str_2974;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.core.window.IWindow;

    public class DetailsWindowCtrl implements IDisposable 
    {
        private var _manager:HabboGroupsManager;
        private var _window:IFrameWindow;
        private var _groupDetailsCtrl:GroupDetailsCtrl;
        private var _groupId:int;

        public function DetailsWindowCtrl(k:HabboGroupsManager)
        {
            this._manager = k;
            this._groupDetailsCtrl = new GroupDetailsCtrl(k, true);
        }

        public function dispose():void
        {
            this._manager = null;
            if (this._window)
            {
                this._window.dispose();
                this._window = null;
            }
            if (this._groupDetailsCtrl)
            {
                this._groupDetailsCtrl.dispose();
                this._groupDetailsCtrl = null;
            }
        }

        public function get disposed():Boolean
        {
            return this._manager == null;
        }

        public function _Str_18808(k:int):Boolean
        {
            return ((!(this._window == null)) && (this._window.visible)) && (k == this._groupId);
        }

        public function _Str_3702(k:_Str_2974):void
        {
            if (((((!(this._window == null)) && (this._window.visible)) && (k.groupId == this._groupId)) || (k._Str_8199)))
            {
                this._groupId = k.groupId;
                this._Str_2755();
                this._groupDetailsCtrl._Str_3702(IWindowContainer(this._window.findChildByName("group_cont")), k);
                if (k._Str_8199)
                {
                    this._window.visible = true;
                    this._window.activate();
                }
            }
        }

        private function _Str_2755():void
        {
            if (this._window != null)
            {
                return;
            }
            this._window = IFrameWindow(this._manager.getXmlWindow("group_info_window"));
            this._window.findChildByTag("close").procedure = this._Str_2392;
            this._window.center();
        }

        private function _Str_2392(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type != WindowMouseEvent.CLICK)
            {
                return;
            }
            this.close();
        }

        public function close():void
        {
            if (this._window != null)
            {
                this._groupId = 0;
                this._window.visible = false;
            }
        }

        public function _Str_26461(k:int):void
        {
            if (this._groupId == k)
            {
                this.close();
            }
        }
    }
}
