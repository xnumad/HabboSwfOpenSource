//com.sulake.habbo.communication.messages.parser.navigator.RoomInfoUpdatedMessageParser

package com.sulake.habbo.communication.messages.parser.navigator{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class RoomInfoUpdatedMessageParser implements IMessageParser {

        private var _flatId:int;

        public function RoomInfoUpdatedMessageParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;

        public function get flatId():int;


    }
}//package com.sulake.habbo.communication.messages.parser.navigator

