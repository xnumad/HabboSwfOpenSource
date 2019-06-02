//com.sulake.habbo.communication.messages.parser.users.ApproveNameMessageParser

package com.sulake.habbo.communication.messages.parser.users{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class ApproveNameMessageParser implements IMessageParser {

        private var _result:int;
        private var _nameValidationInfo:String;

        public function ApproveNameMessageParser();

        public function get result():int;

        public function get nameValidationInfo():String;

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;


    }
}//package com.sulake.habbo.communication.messages.parser.users

