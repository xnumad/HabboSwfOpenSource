package com.sulake.habbo.communication.messages.parser.handshake
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class UserRightsMessageParser implements IMessageParser 
    {
        private var _clubLevel:int;
        private var _securityLevel:int;
        private var isAmbassador:Boolean;


        public function flush():Boolean
        {
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._clubLevel = k.readInteger();
            this._securityLevel = k.readInteger();
            this.isAmbassador = k.readBoolean();
            return true;
        }

        public function get clubLevel():int
        {
            return this._clubLevel;
        }

        public function get securityLevel():int
        {
            return this._securityLevel;
        }

        public function get isAmbassador():Boolean
        {
            return this.isAmbassador;
        }
    }
}
