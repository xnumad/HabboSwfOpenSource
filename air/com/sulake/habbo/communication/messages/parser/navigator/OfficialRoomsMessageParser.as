//com.sulake.habbo.communication.messages.parser.navigator.OfficialRoomsMessageParser

package com.sulake.habbo.communication.messages.parser.navigator{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.habbo.communication.messages.incoming.navigator.OfficialRoomsData;
    import com.sulake.habbo.communication.messages.incoming.navigator.OfficialRoomEntryData;
    import com.sulake.habbo.communication.messages.incoming.navigator.PromotedRoomsData;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class OfficialRoomsMessageParser implements IMessageParser {

        private var _data:OfficialRoomsData;
        private var _adRoomData:OfficialRoomEntryData;
        private var _promotedRooms:PromotedRoomsData;

        public function OfficialRoomsMessageParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;

        public function get data():OfficialRoomsData;

        public function get adRoom():OfficialRoomEntryData;

        public function get promotedRooms():PromotedRoomsData;


    }
}//package com.sulake.habbo.communication.messages.parser.navigator

