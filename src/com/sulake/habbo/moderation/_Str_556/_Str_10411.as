package com.sulake.habbo.moderation._Str_556
{
    import com.sulake.habbo.moderation.ModerationManager;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.habbo.communication.messages.outgoing.friendlist._Str_4348;
    import com.sulake.core.window.events.WindowEvent;

    public class _Str_10411 
    {
        private var _Str_2327:ModerationManager;
        private var _Str_2306:int;

        public function _Str_10411(k:ModerationManager, _arg_2:IWindow, _arg_3:int)
        {
            this._Str_2327 = k;
            this._Str_2306 = _arg_3;
            _arg_2.procedure = this.onClick;
        }

        private function onClick(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type != WindowMouseEvent.CLICK)
            {
                return;
            }
            this._Str_2327.connection.send(new _Str_4348(this._Str_2306));
        }
    }
}
