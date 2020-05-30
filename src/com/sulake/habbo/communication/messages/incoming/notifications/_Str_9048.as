package com.sulake.habbo.communication.messages.incoming.notifications
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.notifications.PetLevelNotificationParser;

    public class _Str_9048 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_9048(k:Function)
        {
            super(k, PetLevelNotificationParser);
        }

        public function getParser():PetLevelNotificationParser
        {
            return _parser as PetLevelNotificationParser;
        }
    }
}
