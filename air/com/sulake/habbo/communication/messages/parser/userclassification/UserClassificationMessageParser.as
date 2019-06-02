//com.sulake.habbo.communication.messages.parser.userclassification.UserClassificationMessageParser

package com.sulake.habbo.communication.messages.parser.userclassification{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.utils.Map;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class UserClassificationMessageParser implements IMessageParser {

        private var _classifiedUsersNames:Map;
        private var _classifiedUsersClass:Map;

        public function UserClassificationMessageParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;

        public function get classifiedUsernameMap():Map;

        public function get classifiedUserTypeMap():Map;


    }
}//package com.sulake.habbo.communication.messages.parser.userclassification

