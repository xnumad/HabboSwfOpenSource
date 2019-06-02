//com.sulake.habbo.communication.messages.incoming.handshake.PingMessageEvent

package com.sulake.habbo.communication.messages.incoming.handshake{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;

    [SecureSWF(rename="true")]
    public class PingMessageEvent extends MessageEvent implements IMessageEvent {

        public function PingMessageEvent(k:Function);

    }
}//package com.sulake.habbo.communication.messages.incoming.handshake

