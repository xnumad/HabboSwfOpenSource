package com.sulake.habbo.communication.messages.incoming.availability
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.availability.AvailabilityStatusMessageParser;

    public class _Str_9281 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_9281(k:Function)
        {
            super(k, AvailabilityStatusMessageParser);
        }

        public function getParser():AvailabilityStatusMessageParser
        {
            return _parser as AvailabilityStatusMessageParser;
        }
    }
}
