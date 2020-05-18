package com.sulake.habbo.communication.messages.incoming._Str_516
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser._Str_524.LatencyPingResponseMessageParser;

    public class LatencyPingResponseMessageEvent extends MessageEvent implements IMessageEvent 
    {
        public function LatencyPingResponseMessageEvent(k:Function)
        {
            super(k, LatencyPingResponseMessageParser);
        }

        public function getParser():LatencyPingResponseMessageParser
        {
            return _parser as LatencyPingResponseMessageParser;
        }
    }
}
