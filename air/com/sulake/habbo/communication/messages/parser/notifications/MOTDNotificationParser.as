//com.sulake.habbo.communication.messages.parser.notifications.MOTDNotificationParser

package com.sulake.habbo.communication.messages.parser.notifications{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class MOTDNotificationParser implements IMessageParser {

        private var _messages:Array;

        public function MOTDNotificationParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;

        public function get messages():Array;


    }
}//package com.sulake.habbo.communication.messages.parser.notifications

