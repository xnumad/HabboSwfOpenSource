package com.sulake.habbo.help
{
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.core.window.components.IFrameWindow;
    import com.sulake.habbo.communication.messages.incoming.help._Str_9538;
    import com.sulake.habbo.communication.messages.incoming.help._Str_8429;
    import com.sulake.core.window.components.ITextWindow;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.core.window.IWindow;

    public class ChatReviewReporterFeedbackCtrl implements IDisposable 
    {
        private var _habboHelp:HabboHelp;
        private var _window:IFrameWindow;

        public function ChatReviewReporterFeedbackCtrl(k:HabboHelp)
        {
            this._habboHelp = k;
            this._habboHelp.communicationManager.addHabboConnectionMessageEvent(new _Str_9538(this._Str_25116));
            this._habboHelp.communicationManager.addHabboConnectionMessageEvent(new _Str_8429(this._Str_22825));
        }

        public function dispose():void
        {
            this._habboHelp = null;
            if (this._window)
            {
                this._window.dispose();
                this._window = null;
            }
        }

        public function get disposed():Boolean
        {
            return this._habboHelp == null;
        }

        private function _Str_25116(k:_Str_9538):void
        {
            this.show(k.getParser()._Str_5961);
        }

        private function _Str_22825(k:_Str_8429):void
        {
            this.show(k.getParser()._Str_5961);
        }

        public function show(k:String):void
        {
            if (!this.enabled)
            {
                return;
            }
            this.prepare();
            this._Str_2497("caption_txt", k, "caption");
            this._Str_2497("body_txt", k, "body");
            this._Str_2497("note_txt", k, "note");
            var _local_2:ITextWindow = ITextWindow(this._window.findChildByName("caption_txt"));
            this._window.findChildByName("body_txt").y = ((_local_2.y + _local_2.textHeight) + 5);
            this._window.visible = true;
        }

        private function _Str_2497(k:String, _arg_2:String, _arg_3:String):void
        {
            var _local_4:String = ((("guide.bully.request.reporter." + _arg_2) + ".") + _arg_3);
            if (this._habboHelp.localization.getLocalization(_local_4, "") == "")
            {
                _local_4 = ("guide.bully.request.reporter." + _arg_3);
            }
            this._window.findChildByName(k).caption = (("${" + _local_4) + "}");
        }

        private function prepare():void
        {
            if (this._window != null)
            {
                return;
            }
            this._window = IFrameWindow(this._habboHelp.getXmlWindow("chat_review_reporter_feedback"));
            this._window.procedure = this._Str_2533;
            this._window.center();
        }

        private function _Str_2533(k:WindowEvent, _arg_2:IWindow):void
        {
            if ((((!(k.type == WindowMouseEvent.CLICK)) || (this._window == null)) || (this._window.disposed)))
            {
                return;
            }
            if (((_arg_2.name == "close_button") || (_arg_2.name == "header_button_close")))
            {
                this._window.visible = false;
            }
        }

        private function get enabled():Boolean
        {
            return this._habboHelp.getBoolean("chatreviewreporterfeedbackctrl.enabled");
        }
    }
}
