//com.sulake.habbo.communication.messages.outgoing.friendlist.GetFriendRequestsMessageComposer

package com.sulake.habbo.communication.messages.outgoing.friendlist{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class GetFriendRequestsMessageComposer implements IMessageComposer {

        public function GetFriendRequestsMessageComposer();

        public function dispose():void;

        public function getMessageArray():Array;


    }
}//package com.sulake.habbo.communication.messages.outgoing.friendlist

