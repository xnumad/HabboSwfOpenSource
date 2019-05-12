package com.sulake.habbo.moderation
{
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.habbo.communication.messages.parser.moderation._Str_2484;
    import com.sulake.core.window.components.IFrameWindow;
    import com.sulake.core.window.components.IDropMenuWindow;
    import com.sulake.core.window.components.ITextFieldWindow;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.habbo.communication.messages.outgoing.moderator._Str_7103;
    import com.sulake.habbo.communication.messages.outgoing.moderator._Str_4767;
    import com.sulake.habbo.window.utils._Str_2418;

    public class SendMsgsCtrl implements IDisposable, ITrackedWindow 
    {
        private static const _Str_16626:int = -999;

        private var _main:ModerationManager;
        private var _targetUserId:int;
        private var _targetUserName:String;
        private var _issue:_Str_2484;
        private var _frame:IFrameWindow;
        private var _msgSelect:IDropMenuWindow;
        private var _msgInput:ITextFieldWindow;
        private var _disposed:Boolean;
        private var _placeHolderMessage:Boolean = true;

        public function SendMsgsCtrl(k:ModerationManager, _arg_2:int, _arg_3:String, _arg_4:_Str_2484)
        {
            this._main = k;
            this._targetUserId = _arg_2;
            this._targetUserName = _arg_3;
            this._issue = _arg_4;
        }

        public function get disposed():Boolean
        {
            return this._disposed;
        }

        public function show():void
        {
            this._frame = IFrameWindow(this._main.getXmlWindow("send_msgs"));
            this._frame.caption = ("Msg To: " + this._targetUserName);
            this._frame.findChildByName("send_message_but").procedure = this._Str_22479;
            this._msgInput = ITextFieldWindow(this._frame.findChildByName("message_input"));
            this._msgInput.procedure = this._Str_12396;
            this._msgSelect = IDropMenuWindow(this._frame.findChildByName("msgTemplatesSelect"));
            this._Str_23308(this._msgSelect);
            this._msgSelect.procedure = this._Str_19008;
            var k:IWindow = this._frame.findChildByTag("close");
            k.procedure = this._Str_2392;
            this._frame.visible = true;
        }

        public function getType():int
        {
            return WindowTracker._Str_18900;
        }

        public function getId():String
        {
            return this._targetUserName;
        }

        public function _Str_2259():IFrameWindow
        {
            return this._frame;
        }

        private function _Str_23308(k:IDropMenuWindow):void
        {
            Logger.log(("MSG TEMPLATES: " + this._main._Str_3325._Str_15690.length));
            k.populate(this._main._Str_3325._Str_15690);
        }

        private function _Str_19008(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type != WindowEvent.WINDOW_EVENT_SELECTED)
            {
                return;
            }
            var _local_3:String = this._main._Str_3325._Str_15690[this._msgSelect.selection];
            if (_local_3 != null)
            {
                this._placeHolderMessage = false;
                this._msgInput.text = _local_3;
            }
        }

        private function _Str_22479(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type != WindowMouseEvent.CLICK)
            {
                return;
            }
            if (((this._placeHolderMessage) || (this._msgInput.text == "")))
            {
                this._main.windowManager.alert("Alert", "You must input a message to the user", 0, this._Str_3168);
                return;
            }
            Logger.log("Sending message...");
            this._main.connection.send(new _Str_7103(this._targetUserId, this._msgInput.text, _Str_16626, ((this._issue != null) ? this._issue._Str_2869 : _Str_4767._Str_2979)));
            this.dispose();
        }

        private function _Str_2392(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type != WindowMouseEvent.CLICK)
            {
                return;
            }
            this.dispose();
        }

        private function _Str_12396(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type != WindowEvent.WINDOW_EVENT_FOCUSED)
            {
                return;
            }
            if (this._placeHolderMessage)
            {
                this._msgInput.text = "";
                this._placeHolderMessage = false;
            }
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
            this._msgSelect = null;
            this._msgInput = null;
            this._main = null;
        }

        private function _Str_3168(k:_Str_2418, _arg_2:WindowEvent):void
        {
            k.dispose();
        }
    }
}
