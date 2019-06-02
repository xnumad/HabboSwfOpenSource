//com.sulake.habbo.communication.messages.parser.help.IssueCloseNotificationMessageParser

package com.sulake.habbo.communication.messages.parser.help{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class IssueCloseNotificationMessageParser implements IMessageParser {

        private var _closeReason:int;

        public function IssueCloseNotificationMessageParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;

        public function get closeReason():int;


    }
}//package com.sulake.habbo.communication.messages.parser.help

