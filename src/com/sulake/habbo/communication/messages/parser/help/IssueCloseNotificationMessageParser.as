package com.sulake.habbo.communication.messages.parser.help
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class IssueCloseNotificationMessageParser implements IMessageParser
    {
        private var _Str_19723:int;
        private var _messageText:String;


        public function flush():Boolean
        {
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._Str_19723 = k.readInteger();
            this._messageText = k.readString();
            return true;
        }

        public function get _Str_25784():int
        {
            return this._Str_19723;
        }

        public function get _Str_3460():String
        {
            return this._messageText;
        }
    }
}
