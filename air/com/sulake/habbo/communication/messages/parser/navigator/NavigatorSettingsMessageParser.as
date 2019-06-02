//com.sulake.habbo.communication.messages.parser.navigator.NavigatorSettingsMessageParser

package com.sulake.habbo.communication.messages.parser.navigator{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class NavigatorSettingsMessageParser implements IMessageParser {

        private var _homeRoomId:int;
        private var _roomIdToEnter:int;

        public function NavigatorSettingsMessageParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;

        public function get homeRoomId():int;

        public function get roomIdToEnter():int;


    }
}//package com.sulake.habbo.communication.messages.parser.navigator

