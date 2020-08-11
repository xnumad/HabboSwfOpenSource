package com.sulake.habbo.communication.messages.incoming.availability
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.availability.MaintenanceStatusMessageParser;

    public class MaintenanceStatusMessageEvent extends MessageEvent implements IMessageEvent
    {
        public function MaintenanceStatusMessageEvent(k:Function)
        {
            super(k, MaintenanceStatusMessageParser);
        }

        public function getParser():MaintenanceStatusMessageParser
        {
            return _parser as MaintenanceStatusMessageParser;
        }
    }
}
