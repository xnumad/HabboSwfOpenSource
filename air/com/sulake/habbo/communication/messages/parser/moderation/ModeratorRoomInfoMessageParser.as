//com.sulake.habbo.communication.messages.parser.moderation.ModeratorRoomInfoMessageParser

package com.sulake.habbo.communication.messages.parser.moderation{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.habbo.communication.messages.incoming.moderation.RoomModerationData;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class ModeratorRoomInfoMessageParser implements IMessageParser {

        private var _data:RoomModerationData;

        public function ModeratorRoomInfoMessageParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;

        public function get data():RoomModerationData;


    }
}//package com.sulake.habbo.communication.messages.parser.moderation

