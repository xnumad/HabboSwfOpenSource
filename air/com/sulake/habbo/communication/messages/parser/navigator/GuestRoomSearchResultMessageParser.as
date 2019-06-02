//com.sulake.habbo.communication.messages.parser.navigator.GuestRoomSearchResultMessageParser

package com.sulake.habbo.communication.messages.parser.navigator{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.habbo.communication.messages.incoming.navigator.GuestRoomSearchResultData;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class GuestRoomSearchResultMessageParser implements IMessageParser {

        private var _data:GuestRoomSearchResultData;

        public function GuestRoomSearchResultMessageParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;

        public function get data():GuestRoomSearchResultData;


    }
}//package com.sulake.habbo.communication.messages.parser.navigator

