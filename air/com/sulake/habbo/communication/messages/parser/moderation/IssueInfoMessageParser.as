//com.sulake.habbo.communication.messages.parser.moderation.IssueInfoMessageParser

package com.sulake.habbo.communication.messages.parser.moderation{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class IssueInfoMessageParser implements IMessageParser {

        private var _issueData:IssueMessageData;

        public function IssueInfoMessageParser();

        public function get issueData():IssueMessageData;

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;


    }
}//package com.sulake.habbo.communication.messages.parser.moderation

