package com.sulake.habbo.communication.messages.parser.perk
{
    public class _Str_3818 
    {
        private var _code:String;
        private var _isAllowed:Boolean = false;
        private var _errorMessage:String = "";


        public function get code():String
        {
            return this._code;
        }

        public function set code(k:String):void
        {
            this._code = k;
        }

        public function get isAllowed():Boolean
        {
            return this._isAllowed;
        }

        public function set isAllowed(k:Boolean):void
        {
            this._isAllowed = k;
        }

        public function get errorMessage():String
        {
            return this._errorMessage;
        }

        public function set errorMessage(k:String):void
        {
            this._errorMessage = k;
        }
    }
}
