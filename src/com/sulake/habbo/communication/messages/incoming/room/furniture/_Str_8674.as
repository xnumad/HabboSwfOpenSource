﻿package com.sulake.habbo.communication.messages.incoming.room.furniture
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.room.furniture.GuildFurniContextMenuInfoMessageParser;

    public class _Str_8674 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_8674(k:Function)
        {
            super(k, GuildFurniContextMenuInfoMessageParser);
        }

        public function getParser():GuildFurniContextMenuInfoMessageParser
        {
            return _parser as GuildFurniContextMenuInfoMessageParser;
        }
    }
}
