package com.sulake.habbo.moderation
{
    import com.sulake.core.window.components.IFrameWindow;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.events.WindowEvent;

    public class OpenUserInfo 
    {
        private var _frame:IFrameWindow;
        private var _main:ModerationManager;
        private var _userId:int;

        public function OpenUserInfo(k:IFrameWindow, _arg_2:ModerationManager, _arg_3:IWindow, _arg_4:int)
        {
            this._frame = k;
            this._main = _arg_2;
            this._userId = _arg_4;
            _arg_3.procedure = this.onClick;
        }

        private function onClick(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type != WindowMouseEvent.CLICK)
            {
                return;
            }
            this._main.windowTracker.show(new UserInfoFrameCtrl(this._main, this._userId), this._frame, false, false, true);
        }
    }
}
