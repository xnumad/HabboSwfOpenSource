package com.sulake.habbo.communication.messages.incoming.notifications
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.notifications.NotificationDialogMessageParser;

    public class _Str_8670 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_8670(k:Function)
        {
            super(k, NotificationDialogMessageParser);
        }

        public function getParser():NotificationDialogMessageParser
        {
            return _parser as NotificationDialogMessageParser;
        }
    }
}
