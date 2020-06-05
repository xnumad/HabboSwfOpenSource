package com.sulake.habbo.communication.messages.incoming.room.engine
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.room.engine.FurnitureAliasesMessageParser;

    public class FurnitureAliasesMessageEvent extends MessageEvent
    {
        public function FurnitureAliasesMessageEvent(k:Function)
        {
            super(k, FurnitureAliasesMessageParser);
        }

        public function getParser():FurnitureAliasesMessageParser
        {
            return _parser as FurnitureAliasesMessageParser;
        }
    }
}
