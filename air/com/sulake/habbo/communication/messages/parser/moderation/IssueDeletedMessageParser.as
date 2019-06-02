//com.sulake.habbo.communication.messages.parser.moderation.IssueDeletedMessageParser

package com.sulake.habbo.communication.messages.parser.moderation{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class IssueDeletedMessageParser implements IMessageParser {

        private var _issueId:int;

        public function IssueDeletedMessageParser();

        public function get issueId():int;

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;


    }
}//package com.sulake.habbo.communication.messages.parser.moderation

