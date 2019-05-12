package com.sulake.habbo.utils
{
    import com.sulake.core.window.components.ITextFieldWindow;
    import com.sulake.core.window.events.WindowEvent;

    public class _Str_8330 
    {
        private var _input:ITextFieldWindow;
        private var _Str_3484:Boolean;
        private var _Str_5074:String = "";

        public function _Str_8330(k:ITextFieldWindow, _arg_2:String=null)
        {
            this._input = k;
            if (_arg_2 != null)
            {
                this._Str_3484 = true;
                this._Str_5074 = _arg_2;
                this._input.text = _arg_2;
            }
            this._input.addEventListener(WindowEvent.WINDOW_EVENT_FOCUSED, this._Str_22308);
        }

        public function dispose():void
        {
            if (this._input)
            {
                this._input.dispose();
                this._input = null;
            }
        }

        public function _Str_8407():void
        {
            this._input.text = this._Str_5074;
            this._Str_3484 = true;
        }

        public function getText():String
        {
            return (this._Str_3484) ? "" : this._input.text;
        }

        public function _Str_2497(k:String):void
        {
            this._Str_3484 = false;
            this._input.text = k;
        }

        public function get input():ITextFieldWindow
        {
            return this._input;
        }

        private function _Str_22308(k:WindowEvent):void
        {
            if (!this._Str_3484)
            {
                return;
            }
            this._input.text = "";
            this._Str_3484 = false;
        }
    }
}
