package com.sulake.habbo.communication.messages.incoming.room.furniture
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.room.furniture.CustomUserNotificationMessageParser;

    public class CustomUserNotificationMessageEvent extends MessageEvent
    {
        public function CustomUserNotificationMessageEvent(k:Function)
        {
            super(k, CustomUserNotificationMessageParser);
        }

        public function getParser():CustomUserNotificationMessageParser
        {
            return parser as CustomUserNotificationMessageParser;
        }
    }
}
