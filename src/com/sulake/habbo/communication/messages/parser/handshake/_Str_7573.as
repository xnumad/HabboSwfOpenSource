package com.sulake.habbo.communication.messages.parser.handshake
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_7573 implements IMessageParser 
    {
        private var _clubLevel:int;
        private var _Str_8385:int;
        private var _Str_4890:Boolean;


        public function flush():Boolean
        {
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._clubLevel = k.readInteger();
            this._Str_8385 = k.readInteger();
            this._Str_4890 = k.readBoolean();
            return true;
        }

        public function get clubLevel():int
        {
            return this._clubLevel;
        }

        public function get securityLevel():int
        {
            return this._Str_8385;
        }

        public function get _Str_4050():Boolean
        {
            return this._Str_4890;
        }
    }
}
