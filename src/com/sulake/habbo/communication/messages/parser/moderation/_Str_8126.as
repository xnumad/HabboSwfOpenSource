package com.sulake.habbo.communication.messages.parser.moderation
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_8126 implements IMessageParser 
    {
        private var _message:String;


        public function get message():String
        {
            return this._message;
        }

        public function flush():Boolean
        {
            this._message = "";
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._message = k.readString();
            return true;
        }
    }
}
