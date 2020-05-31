package com.sulake.habbo.communication.messages.incoming.room.engine
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.room.engine.FurnitureAliasesMessageParser;

    public class _Str_6253 extends MessageEvent 
    {
        public function _Str_6253(k:Function)
        {
            super(k, FurnitureAliasesMessageParser);
        }

        public function getParser():FurnitureAliasesMessageParser
        {
            return _parser as FurnitureAliasesMessageParser;
        }
    }
}
