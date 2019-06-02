//com.sulake.habbo.communication.messages.outgoing.friendlist.RemoveFriendMessageComposer

package com.sulake.habbo.communication.messages.outgoing.friendlist{
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.core.runtime.IDisposable;

    [SecureSWF(rename="true")]
    public class RemoveFriendMessageComposer implements IMessageComposer, IDisposable {

        private var _removedAvatarIds:Array;

        public function RemoveFriendMessageComposer();

        public function getMessageArray():Array;

        public function addRemovedFriend(k:int):void;

        public function dispose():void;

        public function get disposed():Boolean;


    }
}//package com.sulake.habbo.communication.messages.outgoing.friendlist

