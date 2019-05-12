package com.sulake.habbo.communication.messages.parser.help
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class GuideSessionMessageParser implements IMessageParser 
    {
        private var _Str_21558:String;
        private var _senderId:int;


        public function flush():Boolean
        {
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._Str_21558 = k.readString();
            this._senderId = k.readInteger();
            return true;
        }

        public function get _Str_24208():String
        {
            return this._Str_21558;
        }

        public function get senderId():int
        {
            return this._senderId;
        }
    }
}
