package com.sulake.habbo.communication.messages.incoming.handshake
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.handshake.UserRightsMessageParser;

    public class UserRightsMessageEvent extends MessageEvent implements IMessageEvent 
    {
        public function UserRightsMessageEvent(k:Function)
        {
            super(k, UserRightsMessageParser);
        }

        public function get clubLevel():int
        {
            return (this._parser as UserRightsMessageParser).clubLevel;
        }

        public function get securityLevel():int
        {
            return (this._parser as UserRightsMessageParser).securityLevel;
        }

        public function get isAmbassador():Boolean
        {
            return (this._parser as UserRightsMessageParser).isAmbassador;
        }
    }
}
