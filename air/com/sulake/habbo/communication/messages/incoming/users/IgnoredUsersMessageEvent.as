//com.sulake.habbo.communication.messages.incoming.users.IgnoredUsersMessageEvent

package com.sulake.habbo.communication.messages.incoming.users{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;

    [SecureSWF(rename="true")]
    public class IgnoredUsersMessageEvent extends MessageEvent implements IMessageEvent {

        public function IgnoredUsersMessageEvent(k:Function);

        public function get ignoredUsers():Array;


    }
}//package com.sulake.habbo.communication.messages.incoming.users

