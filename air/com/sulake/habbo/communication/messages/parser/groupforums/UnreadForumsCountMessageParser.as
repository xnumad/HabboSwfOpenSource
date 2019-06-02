//com.sulake.habbo.communication.messages.parser.groupforums.UnreadForumsCountMessageParser

package com.sulake.habbo.communication.messages.parser.groupforums{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class UnreadForumsCountMessageParser implements IMessageParser {

        private var _unreadForumsCount:int;

        public function UnreadForumsCountMessageParser();

        public function get unreadForumsCount():int;

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;


    }
}//package com.sulake.habbo.communication.messages.parser.groupforums

