package com.sulake.habbo.utils
{
    import com.sulake.core.window.components.ITextFieldWindow;
    import com.sulake.core.window.events.WindowEvent;

    public class InfoText
    {
        private var _input:ITextFieldWindow;
        private var _includeInfo:Boolean;
        private var _infoText:String = "";

        public function InfoText(k:ITextFieldWindow, _arg_2:String=null)
        {
            this._input = k;
            if (_arg_2 != null)
            {
                this._includeInfo = true;
                this._infoText = _arg_2;
                this._input.text = _arg_2;
            }
            this._input.addEventListener(WindowEvent.WINDOW_EVENT_FOCUSED, this.onFocus);
        }

        public function dispose():void
        {
            if (this._input)
            {
                this._input.dispose();
                this._input = null;
            }
        }

        public function goBackToInitialState():void
        {
            this._input.text = this._infoText;
            this._includeInfo = true;
        }

        public function getText():String
        {
            return (this._includeInfo) ? "" : this._input.text;
        }

        public function setText(k:String):void
        {
            this._includeInfo = false;
            this._input.text = k;
        }

        public function get input():ITextFieldWindow
        {
            return this._input;
        }

        private function onFocus(k:WindowEvent):void
        {
            if (!this._includeInfo)
            {
                return;
            }
            this._input.text = "";
            this._includeInfo = false;
        }
    }
}
