package com.sulake.habbo.communication.messages.parser.help
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class CallForHelpResultMessageParser implements IMessageParser
    {
        private var _resultType:int;
        private var _messageText:String;


        public function get resultType():int
        {
            return this._resultType;
        }

        public function get _Str_3460():String
        {
            return this._messageText;
        }

        public function flush():Boolean
        {
            this._resultType = -1;
            this._messageText = "";
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._resultType = k.readInteger();
            this._messageText = k.readString();
            return true;
        }
    }
}
