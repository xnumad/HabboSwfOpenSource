//com.sulake.habbo.communication.messages.incoming.users.HandItemReceivedMessageEvent

package com.sulake.habbo.communication.messages.incoming.users{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;

    [SecureSWF(rename="true")]
    public class HandItemReceivedMessageEvent extends MessageEvent implements IMessageEvent {

        public function HandItemReceivedMessageEvent(k:Function);

        public function get giverUserId():int;

        public function get handItemType():int;


    }
}//package com.sulake.habbo.communication.messages.incoming.users

