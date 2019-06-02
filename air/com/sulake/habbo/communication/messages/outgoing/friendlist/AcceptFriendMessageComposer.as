//com.sulake.habbo.communication.messages.outgoing.friendlist.AcceptFriendMessageComposer

package com.sulake.habbo.communication.messages.outgoing.friendlist{
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.core.runtime.IDisposable;

    [SecureSWF(rename="true")]
    public class AcceptFriendMessageComposer implements IMessageComposer, IDisposable {

        private var _acceptedRequestIds:Array;

        public function AcceptFriendMessageComposer();

        public function getMessageArray():Array;

        public function addAcceptedRequest(k:int):void;

        public function dispose():void;

        public function get disposed():Boolean;


    }
}//package com.sulake.habbo.communication.messages.outgoing.friendlist

