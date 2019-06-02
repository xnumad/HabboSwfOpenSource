package com.sulake.habbo.communication.messages.parser.handshake
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_8786 implements IMessageParser 
    {
        private var _Str_8149:String;

        public function _Str_8786()
        {
            this._Str_8149 = "";
        }

        public function flush():Boolean
        {
            this._Str_8149 = "";
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._Str_8149 = k.readString();
            return true;
        }

        public function get machineID():String
        {
            return this._Str_8149;
        }
    }
}
