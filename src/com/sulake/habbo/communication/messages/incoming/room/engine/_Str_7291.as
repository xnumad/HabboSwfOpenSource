package com.sulake.habbo.communication.messages.incoming.room.engine
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.room.engine.ItemDataUpdateMessageParser;

    public class _Str_7291 extends MessageEvent 
    {
        public function _Str_7291(k:Function)
        {
            super(k, ItemDataUpdateMessageParser);
        }

        public function getParser():ItemDataUpdateMessageParser
        {
            return _parser as ItemDataUpdateMessageParser;
        }
    }
}
