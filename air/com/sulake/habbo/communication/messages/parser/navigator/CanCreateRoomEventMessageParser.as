//com.sulake.habbo.communication.messages.parser.navigator.CanCreateRoomEventMessageParser

package com.sulake.habbo.communication.messages.parser.navigator{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class CanCreateRoomEventMessageParser implements IMessageParser {

        private var _canCreateEvent:Boolean;
        private var _errorCode:int;

        public function CanCreateRoomEventMessageParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;

        public function get canCreateEvent():Boolean;

        public function get errorCode():int;


    }
}//package com.sulake.habbo.communication.messages.parser.navigator

