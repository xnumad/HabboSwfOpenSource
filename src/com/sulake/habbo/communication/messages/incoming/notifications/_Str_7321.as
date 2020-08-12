package com.sulake.habbo.communication.messages.incoming.notifications
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.notifications.MOTDNotificationParser;

    public class _Str_7321 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_7321(k:Function)
        {
            super(k, MOTDNotificationParser);
        }

        public function getParser():MOTDNotificationParser
        {
            return _parser as MOTDNotificationParser;
        }
    }
}
