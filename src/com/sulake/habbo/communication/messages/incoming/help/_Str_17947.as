package com.sulake.habbo.communication.messages.incoming.help
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.help.HotelMergeNameChangeParser;

    public class _Str_17947 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_17947(k:Function)
        {
            super(k, HotelMergeNameChangeParser);
        }

        public function getParser():HotelMergeNameChangeParser
        {
            return _parser as HotelMergeNameChangeParser;
        }
    }
}
