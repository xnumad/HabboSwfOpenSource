//com.sulake.habbo.communication.messages.parser.navigator.RoomThumbnailUpdateResultMessageParser

package com.sulake.habbo.communication.messages.parser.navigator{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class RoomThumbnailUpdateResultMessageParser implements IMessageParser {

        private var _flatId:int;
        private var _resultCode:int;

        public function RoomThumbnailUpdateResultMessageParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;

        public function get flatId():int;

        public function get resultCode():int;


    }
}//package com.sulake.habbo.communication.messages.parser.navigator

