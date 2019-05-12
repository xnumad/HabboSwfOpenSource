package com.sulake.habbo.communication.messages.parser.handshake
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_7264 implements IMessageParser 
    {
        private var _Str_12080:Boolean;


        public function flush():Boolean
        {
            return false;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._Str_12080 = k.readBoolean();
            return true;
        }

        public function get _Str_18128():Boolean
        {
            return this._Str_12080;
        }
    }
}
