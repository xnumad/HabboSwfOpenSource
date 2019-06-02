//com.sulake.habbo.communication.messages.parser.room.furniture.RentableSpaceRentOkMessageParser

package com.sulake.habbo.communication.messages.parser.room.furniture{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class RentableSpaceRentOkMessageParser implements IMessageParser {

        private var _expiryTime:int;

        public function RentableSpaceRentOkMessageParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;

        public function get expiryTime():int;


    }
}//package com.sulake.habbo.communication.messages.parser.room.furniture

