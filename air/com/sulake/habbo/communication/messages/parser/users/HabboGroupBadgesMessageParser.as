//com.sulake.habbo.communication.messages.parser.users.HabboGroupBadgesMessageParser

package com.sulake.habbo.communication.messages.parser.users{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.utils.Map;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class HabboGroupBadgesMessageParser implements IMessageParser {

        protected var _badges:Map;

        public function HabboGroupBadgesMessageParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;

        public function get badges():Map;


    }
}//package com.sulake.habbo.communication.messages.parser.users

