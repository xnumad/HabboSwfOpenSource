package com.sulake.habbo.communication.messages.incoming.room.engine
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.room.engine.ItemRemoveMessageParser;

    public class _Str_8204 extends MessageEvent 
    {
        public function _Str_8204(k:Function)
        {
            super(k, ItemRemoveMessageParser);
        }

        public function getParser():ItemRemoveMessageParser
        {
            return _parser as ItemRemoveMessageParser;
        }
    }
}
