//com.sulake.habbo.communication.messages.outgoing.friendlist.FollowFriendMessageComposer

package com.sulake.habbo.communication.messages.outgoing.friendlist{
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.core.runtime.IDisposable;

    [SecureSWF(rename="true")]
    public class FollowFriendMessageComposer implements IMessageComposer, IDisposable {

        private var _array:Array;

        public function FollowFriendMessageComposer(k:int);

        public function getMessageArray():Array;

        public function dispose():void;

        public function get disposed():Boolean;


    }
}//package com.sulake.habbo.communication.messages.outgoing.friendlist

