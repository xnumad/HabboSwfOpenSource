package com.sulake.habbo.communication.messages.incoming.room.furniture
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.room.furniture.CustomUserNotificationMessageParser;

    public class _Str_6132 extends MessageEvent 
    {
        public function _Str_6132(k:Function)
        {
            super(k, CustomUserNotificationMessageParser);
        }

        public function getParser():CustomUserNotificationMessageParser
        {
            return parser as CustomUserNotificationMessageParser;
        }
    }
}
