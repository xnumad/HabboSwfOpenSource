package com.sulake.habbo.communication.messages.parser.users
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_11993 implements IMessageParser 
    {
        private var _link:String;


        public function get link():String
        {
            return this._link;
        }

        public function flush():Boolean
        {
            this._link = null;
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._link = k.readString();
            return true;
        }
    }
}
