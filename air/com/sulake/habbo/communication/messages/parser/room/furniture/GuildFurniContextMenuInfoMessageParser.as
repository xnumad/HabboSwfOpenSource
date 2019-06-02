//com.sulake.habbo.communication.messages.parser.room.furniture.GuildFurniContextMenuInfoMessageParser

package com.sulake.habbo.communication.messages.parser.room.furniture{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class GuildFurniContextMenuInfoMessageParser implements IMessageParser {

        private var _objectId:int;
        private var _guildId:int;
        private var _guildName:String;
        private var _guildHomeRoomId:int;
        private var _userIsMember:Boolean;
        private var _guildHasReadableForum:Boolean;

        public function GuildFurniContextMenuInfoMessageParser();

        public function get objectId():int;

        public function get guildId():int;

        public function get guildName():String;

        public function get guildHomeRoomId():int;

        public function get userIsMember():Boolean;

        public function get guildHasReadableForum():Boolean;

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;


    }
}//package com.sulake.habbo.communication.messages.parser.room.furniture

