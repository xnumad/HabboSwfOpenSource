package com.sulake.habbo.phonenumber
{
    import com.sulake.core.window.components.IFrameWindow;
    import flash.utils.Timer;
    import com.sulake.core.window.components.ITextFieldWindow;
    import flash.utils.getTimer;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.core.window.IWindow;
    import flash.events.TimerEvent;
    import com.sulake.core.window.components.ILabelWindow;

    public class VerificationCodeInputView 
    {
        private static const _Str_7625:int = 10;

        private var _component:HabboPhoneNumber;
        private var _window:IFrameWindow;
        private var _inputTextNeedsClearing:Boolean = true;
        private var _waitTimer:Timer;

        public function VerificationCodeInputView(k:HabboPhoneNumber)
        {
            this._component = k;
            this.createWindow();
        }

        public function dispose():void
        {
            if (this._window)
            {
                this._window.dispose();
                this._window = null;
            }
            if (this._waitTimer)
            {
                this._waitTimer.reset();
                this._waitTimer = null;
            }
            this._component = null;
        }

        public function _Str_16661(k:int):void
        {
            this._component.windowManager.alert("${generic.alert.title}", (("${phone.number.verify.error." + k) + "}"), 0, null);
            ITextFieldWindow(this._window.findChildByName("verification_code_input")).textColor = 0xFF0000;
            this._window.findChildByName("verification_code_input").enable();
            this._inputTextNeedsClearing = true;
        }

        private function createWindow():void
        {
            if (this._window)
            {
                return;
            }
            this._window = IFrameWindow(this._component.windowManager.buildFromXML(XML(this._component.assets.getAssetByName("phonenumber_verify_xml").content)));
            this._window.center();
            if (this._window.findChildByName("wait_link"))
            {
                this._window.findChildByName("wait_link").procedure = this._Str_13227;
            }
            this._window.findChildByName("ok_button").procedure = this._Str_13227;
            if (this._window.findChildByName("header_button_close"))
            {
                this._window.findChildByName("header_button_close").visible = false;
            }
            this._window.findChildByName("verification_code_input").procedure = this._Str_13227;
            this._window.findChildByName("did_not_receive_code_link").procedure = this._Str_13227;
            this._window.findChildByName("ok_button").disable();
            this._window.findChildByName("verification_code_input").enable();
            if ((this._component._Str_20480 - getTimer()) <= 0)
            {
                this._Str_15400();
            }
            else
            {
                this._Str_25063();
            }
            ITextFieldWindow(this._window.findChildByName("verification_code_input")).maxChars = _Str_7625;
            this._inputTextNeedsClearing = true;
        }

        private function _Str_13227(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type != WindowMouseEvent.CLICK)
            {
                return;
            }
            switch (_arg_2.name)
            {
                case "header_button_close":
                case "wait_link":
                    this._component._Str_16951(true);
                    return;
                case "did_not_receive_code_link":
                    this._component._Str_24068();
                    return;
                case "ok_button":
                    this._component._Str_24369(this._window.findChildByName("verification_code_input").caption);
                    this._window.findChildByName("ok_button").disable();
                    this._window.findChildByName("verification_code_input").disable();
                    return;
                case "verification_code_input":
                    if (this._inputTextNeedsClearing)
                    {
                        this._window.findChildByName("verification_code_input").caption = "";
                        this._inputTextNeedsClearing = false;
                    }
                    this._window.findChildByName("ok_button").enable();
                    ITextFieldWindow(this._window.findChildByName("verification_code_input")).textColor = 0;
                    return;
            }
        }

        public function _Str_15400():void
        {
            this._window.findChildByName("did_not_receive_code_link").visible = true;
            this._window.findChildByName("retry_wait_label").visible = false;
        }

        public function _Str_25063(k:int=0):void
        {
            this._window.findChildByName("did_not_receive_code_link").visible = false;
            this._window.findChildByName("retry_wait_label").visible = true;
            this._Str_12609();
            this._waitTimer = new Timer(1000);
            this._waitTimer.addEventListener(TimerEvent.TIMER, this._Str_12609);
            this._waitTimer.start();
        }

        private function _Str_12609(k:TimerEvent=null):void
        {
            var _local_2:String = this._component.localizationManager.getLocalization("phone.number.verify.wait.remaining", "");
            var _local_3:int = Math.max(0, ((this._component._Str_20480 - getTimer()) / 1000));
            _local_2 = _local_2.replace("{0}", _local_3);
            (this._window.findChildByName("retry_wait_label") as ILabelWindow).text = _local_2;
            if (_local_3 == 0)
            {
                if (this._waitTimer)
                {
                    this._waitTimer.stop();
                }
                this._waitTimer = null;
                this._Str_15400();
            }
        }
    }
}





