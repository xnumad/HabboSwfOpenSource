package com.sulake.habbo.communication.messages.parser.moderation
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_7904 implements IMessageParser 
    {
        private var _message:String;
        private var _url:String;


        public function get message():String
        {
            return this._message;
        }

        public function get url():String
        {
            return this._url;
        }

        public function flush():Boolean
        {
            this._message = "";
            this._url = "";
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._message = k.readString();
            this._url = k.readString();
            return true;
        }
    }
}
