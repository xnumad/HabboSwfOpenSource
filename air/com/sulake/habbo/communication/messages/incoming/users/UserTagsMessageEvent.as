//com.sulake.habbo.communication.messages.incoming.users.UserTagsMessageEvent

package com.sulake.habbo.communication.messages.incoming.users{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;

    [SecureSWF(rename="true")]
    public class UserTagsMessageEvent extends MessageEvent implements IMessageEvent {

        public function UserTagsMessageEvent(k:Function);

        public function get tags():Array;

        public function get userId():int;


    }
}//package com.sulake.habbo.communication.messages.incoming.users

