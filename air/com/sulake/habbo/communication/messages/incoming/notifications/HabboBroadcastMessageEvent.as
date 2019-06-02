//com.sulake.habbo.communication.messages.incoming.notifications.HabboBroadcastMessageEvent

package com.sulake.habbo.communication.messages.incoming.notifications{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.notifications.HabboBroadcastMessageParser;

    [SecureSWF(rename="true")]
    public class HabboBroadcastMessageEvent extends MessageEvent implements IMessageEvent {

        public function HabboBroadcastMessageEvent(k:Function);

        public function get messageText():String;

        public function getParser():HabboBroadcastMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.notifications

