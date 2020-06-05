package com.sulake.habbo.communication.messages.incoming.room.engine
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.room.engine.ItemUpdateMessageParser;

    public class ItemUpdateMessageEvent extends MessageEvent
    {
        public function ItemUpdateMessageEvent(k:Function)
        {
            super(k, ItemUpdateMessageParser);
        }

        public function getParser():ItemUpdateMessageParser
        {
            return _parser as ItemUpdateMessageParser;
        }
    }
}
