//com.sulake.habbo.communication.messages.parser.room.action.DanceMessageParser

package com.sulake.habbo.communication.messages.parser.room.action{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class DanceMessageParser implements IMessageParser {

        private var _userId:int;
        private var _danceStyle:int;

        public function DanceMessageParser();

        public function get userId():int;

        public function get danceStyle():int;

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;


    }
}//package com.sulake.habbo.communication.messages.parser.room.action

