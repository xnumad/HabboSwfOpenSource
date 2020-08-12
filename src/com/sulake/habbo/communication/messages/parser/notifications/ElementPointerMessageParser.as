package com.sulake.habbo.communication.messages.parser.notifications
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class ElementPointerMessageParser implements IMessageParser
    {
        private var _key:String;


        public function flush():Boolean
        {
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._key = k.readString();
            return true;
        }

        public function get key():String
        {
            return this._key;
        }
    }
}
