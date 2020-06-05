package com.sulake.habbo.communication.messages.incoming.room.engine
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.room.engine.ItemRemoveMessageParser;

    public class ItemRemoveMessageEvent extends MessageEvent
    {
        public function ItemRemoveMessageEvent(k:Function)
        {
            super(k, ItemRemoveMessageParser);
        }

        public function getParser():ItemRemoveMessageParser
        {
            return _parser as ItemRemoveMessageParser;
        }
    }
}
