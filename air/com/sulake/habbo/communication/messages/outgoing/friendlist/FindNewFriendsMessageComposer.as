//com.sulake.habbo.communication.messages.outgoing.friendlist.FindNewFriendsMessageComposer

package com.sulake.habbo.communication.messages.outgoing.friendlist{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class FindNewFriendsMessageComposer implements IMessageComposer {

        public function FindNewFriendsMessageComposer();

        public function getMessageArray():Array;

        public function dispose():void;


    }
}//package com.sulake.habbo.communication.messages.outgoing.friendlist

