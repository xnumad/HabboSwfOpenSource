//com.sulake.habbo.communication.messages.parser.users.RelationshipStatusInfoMessageParser

package com.sulake.habbo.communication.messages.parser.users{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.utils.Map;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class RelationshipStatusInfoMessageParser implements IMessageParser {

        private var _userId:int;
        private var _relationshipStatusMap:Map;

        public function RelationshipStatusInfoMessageParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;

        public function get userId():int;

        public function get relationshipStatusMap():Map;


    }
}//package com.sulake.habbo.communication.messages.parser.users

