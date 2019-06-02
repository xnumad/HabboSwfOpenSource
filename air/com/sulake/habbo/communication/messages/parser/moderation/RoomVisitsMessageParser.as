//com.sulake.habbo.communication.messages.parser.moderation.RoomVisitsMessageParser

package com.sulake.habbo.communication.messages.parser.moderation{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.habbo.communication.messages.incoming.moderation.RoomVisitsData;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class RoomVisitsMessageParser implements IMessageParser {

        private var _data:RoomVisitsData;

        public function RoomVisitsMessageParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;

        public function get data():RoomVisitsData;


    }
}//package com.sulake.habbo.communication.messages.parser.moderation

