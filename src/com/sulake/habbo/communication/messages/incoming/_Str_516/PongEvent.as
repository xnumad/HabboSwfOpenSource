package com.sulake.habbo.communication.messages.incoming._Str_516
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser._Str_524.PongMessageParser;

    public class PongEvent extends MessageEvent implements IMessageEvent 
    {
        public function PongEvent(k:Function)
        {
            super(k, PongMessageParser);
        }

        public function getParser():PongMessageParser
        {
            return _parser as PongMessageParser;
        }
    }
}
