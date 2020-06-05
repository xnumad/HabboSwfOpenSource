package com.sulake.habbo.communication.messages.incoming.room.engine
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.room.engine.ItemAddMessageParser;

    public class ItemAddMessageEvent extends MessageEvent
    {
        public function ItemAddMessageEvent(k:Function)
        {
            super(k, ItemAddMessageParser);
        }

        public function getParser():ItemAddMessageParser
        {
            return _parser as ItemAddMessageParser;
        }
    }
}
