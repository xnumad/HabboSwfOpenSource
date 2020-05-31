package com.sulake.habbo.communication.messages.incoming.room.engine
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.room.engine.ItemUpdateMessageParser;

    public class _Str_7464 extends MessageEvent 
    {
        public function _Str_7464(k:Function)
        {
            super(k, ItemUpdateMessageParser);
        }

        public function getParser():ItemUpdateMessageParser
        {
            return _parser as ItemUpdateMessageParser;
        }
    }
}
