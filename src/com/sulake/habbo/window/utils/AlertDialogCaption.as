package com.sulake.habbo.window.utils
{
    public class AlertDialogCaption implements ICaption
    {
        private var _text:String;
        private var _Str_18097:String;
        private var _visible:Boolean;

        public function AlertDialogCaption(k:String, _arg_2:String, _arg_3:Boolean)
        {
            this._text = k;
            this._Str_18097 = _arg_2;
            this._visible = _arg_3;
        }

        public function get text():String
        {
            return this._text;
        }

        public function set text(k:String):void
        {
            this._text = k;
        }

        public function get toolTip():String
        {
            return this._Str_18097;
        }

        public function set toolTip(k:String):void
        {
            this._Str_18097 = k;
        }

        public function get visible():Boolean
        {
            return this._visible;
        }

        public function set visible(k:Boolean):void
        {
            this._visible = k;
        }
    }
}
