package com.sulake.habbo.communication.messages.parser.room.session
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_5762 implements IMessageParser 
    {
        private var _userName:String = null;


        public function get userName():String
        {
            return this._userName;
        }

        public function flush():Boolean
        {
            this._userName = null;
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._userName = k.readString();
            return true;
        }
    }
}
