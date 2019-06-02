//com.sulake.habbo.communication.messages.parser.roomsettings.MuteAllInRoomParser

package com.sulake.habbo.communication.messages.parser.roomsettings{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class MuteAllInRoomParser implements IMessageParser {

        private var _allMuted:Boolean;

        public function MuteAllInRoomParser();

        public function parse(k:IMessageDataWrapper):Boolean;

        public function get allMuted():Boolean;

        public function flush():Boolean;


    }
}//package com.sulake.habbo.communication.messages.parser.roomsettings

