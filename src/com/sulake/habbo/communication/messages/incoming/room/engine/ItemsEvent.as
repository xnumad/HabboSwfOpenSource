package com.sulake.habbo.communication.messages.incoming.room.engine
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.room.engine.ItemsMessageParser;

    public class ItemsEvent extends MessageEvent 
    {
        public function ItemsEvent(k:Function)
        {
            super(k, ItemsMessageParser);
        }

        public function getParser():ItemsMessageParser
        {
            return _parser as ItemsMessageParser;
        }
    }
}
