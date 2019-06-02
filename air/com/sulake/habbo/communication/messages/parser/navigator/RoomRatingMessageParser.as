//com.sulake.habbo.communication.messages.parser.navigator.RoomRatingMessageParser

package com.sulake.habbo.communication.messages.parser.navigator{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class RoomRatingMessageParser implements IMessageParser {

        private var _rating:int;
        private var _canRate:Boolean;

        public function RoomRatingMessageParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;

        public function get rating():int;

        public function get canRate():Boolean;


    }
}//package com.sulake.habbo.communication.messages.parser.navigator

