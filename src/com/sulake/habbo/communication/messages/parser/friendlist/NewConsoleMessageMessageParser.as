package com.sulake.habbo.communication.messages.parser.friendlist
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class NewConsoleMessageMessageParser implements IMessageParser
    {
        private var _senderId:int;
        private var _messageText:String;
        private var _Str_12466:int;
        private var _extraData:String;


        public function flush():Boolean
        {
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._senderId = k.readInteger();
            this._messageText = k.readString();
            this._Str_12466 = k.readInteger();
            if (k.bytesAvailable)
            {
                this._extraData = k.readString();
            }
            return true;
        }

        public function get senderId():int
        {
            return this._senderId;
        }

        public function get _Str_3460():String
        {
            return this._messageText;
        }

        public function get _Str_17201():int
        {
            return this._Str_12466;
        }

        public function get extraData():String
        {
            return this._extraData;
        }
    }
}
