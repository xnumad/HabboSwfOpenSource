package com.sulake.habbo.help
{
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.core.window.components.IFrameWindow;
    import com.sulake.habbo.communication.messages.incoming.help.GuideTicketResolutionMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.help.GuideTicketCreationResultMessageEvent;
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
            this._habboHelp.communicationManager.addHabboConnectionMessageEvent(new GuideTicketResolutionMessageEvent(this.onTicketResolved));
            this._habboHelp.communicationManager.addHabboConnectionMessageEvent(new GuideTicketCreationResultMessageEvent(this._Str_22825));
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

        private function onTicketResolved(k:GuideTicketResolutionMessageEvent):void
        {
            this.show(k.getParser().localizationCode);
        }

        private function _Str_22825(k:GuideTicketCreationResultMessageEvent):void
        {
            this.show(k.getParser().localizationCode);
        }

        public function show(k:String):void
        {
            if (!this.enabled)
            {
                return;
            }
            this.prepare();
            this.setText("caption_txt", k, "caption");
            this.setText("body_txt", k, "body");
            this.setText("note_txt", k, "note");
            var _local_2:ITextWindow = ITextWindow(this._window.findChildByName("caption_txt"));
            this._window.findChildByName("body_txt").y = ((_local_2.y + _local_2.textHeight) + 5);
            this._window.visible = true;
        }

        private function setText(k:String, _arg_2:String, _arg_3:String):void
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
            this._window.procedure = this.windowProcedure;
            this._window.center();
        }

        private function windowProcedure(k:WindowEvent, _arg_2:IWindow):void
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
