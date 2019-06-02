//com.sulake.habbo.communication.messages.incoming.notifications.RestoreClientMessageEvent

package com.sulake.habbo.communication.messages.incoming.notifications{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.notifications.RestoreClientMessageParser;

    [SecureSWF(rename="true")]
    public class RestoreClientMessageEvent extends MessageEvent implements IMessageEvent {

        public function RestoreClientMessageEvent(k:Function);

        public function getParser():RestoreClientMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.notifications

