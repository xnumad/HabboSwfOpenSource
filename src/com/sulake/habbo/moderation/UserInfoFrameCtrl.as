package com.sulake.habbo.moderation
{
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.core.window.components.IFrameWindow;
    import com.sulake.habbo.communication.messages.parser.moderation._Str_2484;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.events.WindowEvent;

    public class UserInfoFrameCtrl implements IDisposable, ITrackedWindow 
    {
        private var _main:ModerationManager;
        private var _userId:int;
        private var _frame:IFrameWindow;
        private var _disposed:Boolean;
        private var _userInfoCtrl:UserInfoCtrl;
        private var _issue:_Str_2484;

        public function UserInfoFrameCtrl(k:ModerationManager, _arg_2:int, _arg_3:_Str_2484=null)
        {
            this._main = k;
            this._userId = _arg_2;
            this._issue = _arg_3;
        }

        public function get disposed():Boolean
        {
            return this._disposed;
        }

        public function show():void
        {
            this._frame = IFrameWindow(this._main.getXmlWindow("user_info_frame"));
            this._frame.caption = "User Info";
            var k:IWindow = this._frame.findChildByTag("close");
            k.procedure = this._Str_2392;
            this._userInfoCtrl = new UserInfoCtrl(this._frame, this._main, this._issue, null, true);
            this._userInfoCtrl.load(this._frame.content, this._userId);
            this._frame.visible = true;
        }

        public function getType():int
        {
            return WindowTracker._Str_17385;
        }

        public function getId():String
        {
            return "" + this._userId;
        }

        public function _Str_2259():IFrameWindow
        {
            return this._frame;
        }

        private function _Str_2392(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type != WindowMouseEvent.CLICK)
            {
                return;
            }
            this.dispose();
        }

        public function dispose():void
        {
            if (this._disposed)
            {
                return;
            }
            this._disposed = true;
            if (this._frame != null)
            {
                this._frame.destroy();
                this._frame = null;
            }
            if (this._userInfoCtrl != null)
            {
                this._userInfoCtrl.dispose();
                this._userInfoCtrl = null;
            }
            this._issue = null;
            this._main = null;
        }
    }
}
