package com.sulake.habbo.communication.messages.incoming.help
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.help.HotelMergeNameChangeParser;

    public class HotelMergeNameChangeEvent extends MessageEvent implements IMessageEvent
    {
        public function HotelMergeNameChangeEvent(k:Function)
        {
            super(k, HotelMergeNameChangeParser);
        }

        public function getParser():HotelMergeNameChangeParser
        {
            return _parser as HotelMergeNameChangeParser;
        }
    }
}
