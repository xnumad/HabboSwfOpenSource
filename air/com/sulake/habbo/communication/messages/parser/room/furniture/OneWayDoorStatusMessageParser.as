//com.sulake.habbo.communication.messages.parser.room.furniture.OneWayDoorStatusMessageParser

package com.sulake.habbo.communication.messages.parser.room.furniture{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class OneWayDoorStatusMessageParser implements IMessageParser {

        private var _id:int;
        private var _status:int;

        public function OneWayDoorStatusMessageParser();

        public function get id():int;

        public function get status():int;

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;


    }
}//package com.sulake.habbo.communication.messages.parser.room.furniture

