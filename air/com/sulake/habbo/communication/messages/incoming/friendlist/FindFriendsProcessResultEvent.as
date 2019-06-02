//com.sulake.habbo.communication.messages.incoming.friendlist.FindFriendsProcessResultEvent

package com.sulake.habbo.communication.messages.incoming.friendlist{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;

    [SecureSWF(rename="true")]
    public class FindFriendsProcessResultEvent extends MessageEvent implements IMessageEvent {

        public function FindFriendsProcessResultEvent(k:Function);

        public function get success():Boolean;


    }
}//package com.sulake.habbo.communication.messages.incoming.friendlist

