package com.sulake.habbo.moderation
{
    import com.sulake.core.window.IWindow;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.events.WindowEvent;

    public class OpenDiscussionThread 
    {
        private var _main:ModerationManager;
        private var _groupId:int;
        private var _threadId:int;

        public function OpenDiscussionThread(k:ModerationManager, _arg_2:IWindow, _arg_3:int, _arg_4:int)
        {
            this._main = k;
            this._groupId = _arg_3;
            this._threadId = _arg_4;
            _arg_2.procedure = this.onClick;
        }

        private function onClick(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type != WindowMouseEvent.CLICK)
            {
                return;
            }
            this._main._Str_24468(this._groupId, this._threadId);
        }
    }
}
