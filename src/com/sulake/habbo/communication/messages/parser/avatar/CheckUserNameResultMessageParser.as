package com.sulake.habbo.communication.messages.parser.avatar
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class CheckUserNameResultMessageParser implements IMessageParser
    {
        private var _resultCode:int = -1;
        private var _name:String;
        private var _nameSuggestions:Array;


        public function get resultCode():int
        {
            return this._resultCode;
        }

        public function get name():String
        {
            return this._name;
        }

        public function get nameSuggestions():Array
        {
            return this._nameSuggestions;
        }

        public function flush():Boolean
        {
            this._resultCode = -1;
            this._name = "";
            this._nameSuggestions = null;
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._resultCode = k.readInteger();
            this._name = k.readString();
            var _local_2:int = k.readInteger();
            this._nameSuggestions = new Array();
            var _local_3:int;
            while (_local_3 < _local_2)
            {
                this._nameSuggestions.push(k.readString());
                _local_3++;
            }
            return true;
        }
    }
}
