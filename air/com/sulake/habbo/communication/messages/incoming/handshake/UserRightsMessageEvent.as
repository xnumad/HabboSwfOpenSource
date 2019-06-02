//com.sulake.habbo.communication.messages.incoming.handshake.UserRightsMessageEvent

package com.sulake.habbo.communication.messages.incoming.handshake{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;

    [SecureSWF(rename="true")]
    public class UserRightsMessageEvent extends MessageEvent implements IMessageEvent {

        public function UserRightsMessageEvent(k:Function);

        public function get clubLevel():int;

        public function get securityLevel():int;

        public function get noobnessLevel():int;


    }
}//package com.sulake.habbo.communication.messages.incoming.handshake

