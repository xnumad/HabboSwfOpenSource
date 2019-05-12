package com.sulake.habbo.communication.messages.parser.navigator
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_11735 implements IMessageParser 
    {
        private var _userName:String;


        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._userName = k.readString();
            return true;
        }

        public function flush():Boolean
        {
            this._userName = null;
            return true;
        }

        public function get userName():String
        {
            return this._userName;
        }
    }
}
