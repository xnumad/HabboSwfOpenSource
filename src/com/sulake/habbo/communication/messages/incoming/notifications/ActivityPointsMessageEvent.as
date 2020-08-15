package com.sulake.habbo.communication.messages.incoming.notifications
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.notifications.ActivityPointsMessageParser;
    import flash.utils.Dictionary;

    public class ActivityPointsMessageEvent extends MessageEvent implements IMessageEvent
    {
        public function ActivityPointsMessageEvent(k:Function)
        {
            super(k, ActivityPointsMessageParser);
        }

        public function get points():Dictionary
        {
            return (_parser as ActivityPointsMessageParser).points;
        }
    }
}
