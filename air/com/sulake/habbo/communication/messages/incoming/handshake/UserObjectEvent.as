//com.sulake.habbo.communication.messages.incoming.handshake.UserObjectEvent

package com.sulake.habbo.communication.messages.incoming.handshake{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.handshake.UserObjectMessageParser;

    [SecureSWF(rename="true")]
    public class UserObjectEvent extends MessageEvent implements IMessageEvent {

        public function UserObjectEvent(k:Function);

        public function getParser():UserObjectMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.handshake

