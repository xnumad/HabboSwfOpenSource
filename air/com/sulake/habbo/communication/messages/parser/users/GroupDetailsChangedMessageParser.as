//com.sulake.habbo.communication.messages.parser.users.GroupDetailsChangedMessageParser

package com.sulake.habbo.communication.messages.parser.users{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class GroupDetailsChangedMessageParser implements IMessageParser {

        private var _groupId:int;

        public function GroupDetailsChangedMessageParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;

        public function get groupId():int;


    }
}//package com.sulake.habbo.communication.messages.parser.users

