//com.sulake.habbo.communication.messages.parser.room.furniture.RentableSpaceRentFailedMessageParser

package com.sulake.habbo.communication.messages.parser.room.furniture{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class RentableSpaceRentFailedMessageParser implements IMessageParser {

        private var _reason:int;

        public function RentableSpaceRentFailedMessageParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;

        public function get reason():int;


    }
}//package com.sulake.habbo.communication.messages.parser.room.furniture

