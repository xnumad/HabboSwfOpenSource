package com.sulake.habbo.communication.messages.incoming.room.engine
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.room.engine.ItemsMessageParser;

    public class _Str_8064 extends MessageEvent 
    {
        public function _Str_8064(k:Function)
        {
            super(k, ItemsMessageParser);
        }

        public function getParser():ItemsMessageParser
        {
            return _parser as ItemsMessageParser;
        }
    }
}
