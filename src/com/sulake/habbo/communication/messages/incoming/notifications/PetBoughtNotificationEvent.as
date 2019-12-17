package com.sulake.habbo.communication.messages.incoming.notifications
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.inventory.pets.PetBoughtNotificationMessageParser;

    public class PetBoughtNotificationEvent extends MessageEvent implements IMessageEvent 
    {
        public function PetBoughtNotificationEvent(k:Function)
        {
            super(k, PetBoughtNotificationMessageParser);
        }

        public function getParser():PetBoughtNotificationMessageParser
        {
            return _parser as PetBoughtNotificationMessageParser;
        }
    }
}
