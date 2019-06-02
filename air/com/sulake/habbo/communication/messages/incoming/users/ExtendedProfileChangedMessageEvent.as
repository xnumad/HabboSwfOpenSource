//com.sulake.habbo.communication.messages.incoming.users.ExtendedProfileChangedMessageEvent

package com.sulake.habbo.communication.messages.incoming.users{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;

    [SecureSWF(rename="true")]
    public class ExtendedProfileChangedMessageEvent extends MessageEvent implements IMessageEvent {

        public function ExtendedProfileChangedMessageEvent(k:Function);

        public function get userId():int;


    }
}//package com.sulake.habbo.communication.messages.incoming.users

