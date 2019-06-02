//com.sulake.habbo.communication.messages.parser.moderation.RoomChatlogMessageParser

package com.sulake.habbo.communication.messages.parser.moderation{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.habbo.communication.messages.incoming.moderation.ChatRecordData;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class RoomChatlogMessageParser implements IMessageParser {

        private var _data:ChatRecordData;

        public function RoomChatlogMessageParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;

        public function get data():ChatRecordData;


    }
}//package com.sulake.habbo.communication.messages.parser.moderation

