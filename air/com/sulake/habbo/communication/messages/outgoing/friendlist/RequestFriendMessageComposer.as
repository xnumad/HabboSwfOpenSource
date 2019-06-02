//com.sulake.habbo.communication.messages.outgoing.friendlist.RequestFriendMessageComposer

package com.sulake.habbo.communication.messages.outgoing.friendlist{
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.core.runtime.IDisposable;

    [SecureSWF(rename="true")]
    public class RequestFriendMessageComposer implements IMessageComposer, IDisposable {

        private var _array:Array;

        public function RequestFriendMessageComposer(k:String);

        public function getMessageArray():Array;

        public function dispose():void;

        public function get disposed():Boolean;


    }
}//package com.sulake.habbo.communication.messages.outgoing.friendlist

