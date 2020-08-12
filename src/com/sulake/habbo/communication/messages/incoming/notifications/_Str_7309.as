package com.sulake.habbo.communication.messages.incoming.notifications
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.notifications.InfoFeedEnableMessageParser;

    public class _Str_7309 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_7309(k:Function)
        {
            super(k, InfoFeedEnableMessageParser);
        }

        public function get enabled():Boolean
        {
            return (_parser as InfoFeedEnableMessageParser).enabled;
        }
    }
}
