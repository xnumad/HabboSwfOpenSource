//com.sulake.habbo.communication.messages.parser.notifications.HabboBroadcastMessageParser

package com.sulake.habbo.communication.messages.parser.notifications{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class HabboBroadcastMessageParser implements IMessageParser {

        private var _messageText:String;

        public function HabboBroadcastMessageParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;

        public function get messageText():String;


    }
}//package com.sulake.habbo.communication.messages.parser.notifications

