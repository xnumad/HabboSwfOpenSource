package com.sulake.habbo.communication.messages.incoming.users
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.users.PetRespectNotificationParser;

    public class PetRespectNotificationEvent extends MessageEvent implements IMessageEvent
    {
        public function PetRespectNotificationEvent(k:Function)
        {
            super(k, PetRespectNotificationParser);
        }

        public function getParser():PetRespectNotificationParser
        {
            return _parser as PetRespectNotificationParser;
        }
    }
}
