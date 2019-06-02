//com.sulake.habbo.communication.messages.parser.moderation.IssuePickFailedMessageParser

package com.sulake.habbo.communication.messages.parser.moderation{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class IssuePickFailedMessageParser implements IMessageParser {

        private var _issues:Array;
        private var _retryEnabled:Boolean;
        private var _retryCount:int;

        public function IssuePickFailedMessageParser();

        public function get issues():Array;

        public function get retryEnabled():Boolean;

        public function get retryCount():int;

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;


    }
}//package com.sulake.habbo.communication.messages.parser.moderation

