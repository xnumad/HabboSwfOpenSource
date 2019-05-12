package com.sulake.habbo.communication.messages.parser.poll
{
    public class _Str_4224 
    {
        private var _value:String;
        private var _choiceText:String;
        private var _Str_18282:int;

        public function _Str_4224(k:String, _arg_2:String, _arg_3:int)
        {
            this._value = k;
            this._choiceText = _arg_2;
            this._Str_18282 = _arg_3;
        }

        public function get value():String
        {
            return this._value;
        }

        public function set value(value:String):void
        {
            this._value = value;
        }

        public function get choiceText():String
        {
            return this._choiceText;
        }

        public function set choiceText(choiceText:String):void
        {
            this._choiceText = choiceText;
        }

        public function get _Str_19972():int
        {
            return this._Str_18282;
        }

        public function set _Str_19972(k:int):void
        {
            this._Str_18282 = k;
        }
    }
}
