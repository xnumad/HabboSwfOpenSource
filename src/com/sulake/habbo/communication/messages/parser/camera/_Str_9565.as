package com.sulake.habbo.communication.messages.parser.camera
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_9565 implements IMessageParser 
    {
        private var _url:String;


        public function get url():String
        {
            return this._url;
        }

        public function flush():Boolean
        {
            this._url = "";
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._url = k.readString();
            return true;
        }
    }
}
