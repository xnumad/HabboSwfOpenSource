package com.sulake.habbo.communication.messages.parser.handshake
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_8602 implements IMessageParser 
    {
        private var _Str_20319:String;
        private var _Str_19896:Boolean = false;


        public function flush():Boolean
        {
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._Str_20319 = k.readString();
            if (k.bytesAvailable)
            {
                this._Str_19896 = k.readBoolean();
            }
            return true;
        }

        public function get _Str_16514():String
        {
            return this._Str_20319;
        }

        public function get _Str_17893():Boolean
        {
            return this._Str_19896;
        }
    }
}
