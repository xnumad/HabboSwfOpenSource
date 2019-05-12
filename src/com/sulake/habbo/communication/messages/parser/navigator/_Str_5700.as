package com.sulake.habbo.communication.messages.parser.navigator
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_5700 implements IMessageParser 
    {
        private var _userName:String = null;


        public function get userName():String
        {
            return this._userName;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            if (k.bytesAvailable)
            {
                this._userName = k.readString();
            }
            return true;
        }

        public function flush():Boolean
        {
            this._userName = null;
            return true;
        }
    }
}
