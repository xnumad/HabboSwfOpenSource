package com.sulake.habbo.communication.messages.incoming.availability
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.availability.MaintenanceStatusMessageParser;

    public class _Str_6521 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_6521(k:Function)
        {
            super(k, MaintenanceStatusMessageParser);
        }

        public function getParser():MaintenanceStatusMessageParser
        {
            return _parser as MaintenanceStatusMessageParser;
        }
    }
}
