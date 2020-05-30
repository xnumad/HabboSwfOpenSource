package com.sulake.habbo.communication.messages.incoming.notifications
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.notifications.HabboActivityPointNotificationMessageParser;

    public class HabboActivityPointNotificationMessageEvent extends MessageEvent implements IMessageEvent
    {
        public function HabboActivityPointNotificationMessageEvent(k:Function)
        {
            super(k, HabboActivityPointNotificationMessageParser);
        }

        public function get amount():int
        {
            return (_parser as HabboActivityPointNotificationMessageParser).amount;
        }

        public function get change():int
        {
            return (_parser as HabboActivityPointNotificationMessageParser).change;
        }

        public function get type():int
        {
            return (_parser as HabboActivityPointNotificationMessageParser).type;
        }
    }
}
