//com.sulake.habbo.communication.messages.parser.navigator.RoomEventMessageParser

package com.sulake.habbo.communication.messages.parser.navigator{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.habbo.communication.messages.incoming.navigator.RoomEventData;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class RoomEventMessageParser implements IMessageParser {

        private var _data:RoomEventData;

        public function RoomEventMessageParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;

        public function get data():RoomEventData;


    }
}//package com.sulake.habbo.communication.messages.parser.navigator

