package com.sulake.habbo.moderation
{
    import com.sulake.core.window.components.IFrameWindow;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.habbo.window.utils._Str_2418;

    public class OpenRoomTool 
    {
        private var _frame:IFrameWindow;
        private var _main:ModerationManager;
        private var _roomId:int;

        public function OpenRoomTool(k:IFrameWindow, _arg_2:ModerationManager, _arg_3:IWindow, _arg_4:int)
        {
            this._frame = k;
            this._main = _arg_2;
            this._roomId = _arg_4;
            _arg_3.procedure = this.onClick;
        }

        private function onClick(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type != WindowMouseEvent.CLICK)
            {
                return;
            }
            this._main.windowTracker.show(new RoomToolCtrl(this._main, this._roomId), this._frame, false, false, true);
        }

        private function _Str_3168(k:_Str_2418, _arg_2:WindowEvent):void
        {
            k.dispose();
        }
    }
}
