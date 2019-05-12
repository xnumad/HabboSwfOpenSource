package com.sulake.habbo.communication.messages.parser.handshake
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_8280 implements IMessageParser 
    {
        private var _Str_21611:String;
        private var _Str_22105:String;


        public function flush():Boolean
        {
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._Str_21611 = k.readString();
            this._Str_22105 = k.readString();
            return true;
        }

        public function get _Str_16332():String
        {
            return this._Str_21611;
        }

        public function get _Str_16524():String
        {
            return this._Str_22105;
        }
    }
}
