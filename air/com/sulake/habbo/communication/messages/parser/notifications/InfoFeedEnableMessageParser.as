//com.sulake.habbo.communication.messages.parser.notifications.InfoFeedEnableMessageParser

package com.sulake.habbo.communication.messages.parser.notifications{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class InfoFeedEnableMessageParser implements IMessageParser {

        private var _enabled:Boolean;

        public function InfoFeedEnableMessageParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;

        public function get enabled():Boolean;


    }
}//package com.sulake.habbo.communication.messages.parser.notifications

