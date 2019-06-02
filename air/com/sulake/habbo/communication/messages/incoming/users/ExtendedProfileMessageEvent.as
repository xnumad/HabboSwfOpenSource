//com.sulake.habbo.communication.messages.incoming.users.ExtendedProfileMessageEvent

package com.sulake.habbo.communication.messages.incoming.users{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;

    [SecureSWF(rename="true")]
    public class ExtendedProfileMessageEvent extends MessageEvent implements IMessageEvent {

        public function ExtendedProfileMessageEvent(k:Function);

        public function get data():ExtendedProfileData;


    }
}//package com.sulake.habbo.communication.messages.incoming.users

