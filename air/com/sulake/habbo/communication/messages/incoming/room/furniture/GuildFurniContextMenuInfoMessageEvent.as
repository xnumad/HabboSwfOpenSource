//com.sulake.habbo.communication.messages.incoming.room.furniture.GuildFurniContextMenuInfoMessageEvent

package com.sulake.habbo.communication.messages.incoming.room.furniture{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.room.furniture.GuildFurniContextMenuInfoMessageParser;

    [SecureSWF(rename="true")]
    public class GuildFurniContextMenuInfoMessageEvent extends MessageEvent implements IMessageEvent {

        public function GuildFurniContextMenuInfoMessageEvent(k:Function);

        public function getParser():GuildFurniContextMenuInfoMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.room.furniture

