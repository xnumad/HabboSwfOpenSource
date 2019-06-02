//com.sulake.habbo.communication.messages.parser.quest.ConcurrentUsersGoalProgressMessageParser

package com.sulake.habbo.communication.messages.parser.quest{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class ConcurrentUsersGoalProgressMessageParser implements IMessageParser {

        private var _state:int;
        private var _userCount:int;
        private var _userCountGoal:int;

        public function ConcurrentUsersGoalProgressMessageParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;

        public function get state():int;

        public function get userCount():int;

        public function get userCountGoal():int;


    }
}//package com.sulake.habbo.communication.messages.parser.quest

