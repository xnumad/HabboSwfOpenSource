package com.sulake.habbo.moderation
{
    import com.sulake.core.window.IWindow;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.events.WindowEvent;

    public class OpenRoomInSpectatorMode 
    {
        private var _main:ModerationManager;
        private var _roomId:int;

        public function OpenRoomInSpectatorMode(k:ModerationManager, _arg_2:IWindow, _arg_3:int)
        {
            this._main = k;
            this._roomId = _arg_3;
            _arg_2.procedure = this.onClick;
        }

        private function onClick(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type != WindowMouseEvent.CLICK)
            {
                return;
            }
            this._main.goToRoom(this._roomId);
        }
    }
}
