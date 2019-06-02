//com.sulake.habbo.communication.messages.outgoing.friendlist.DeclineFriendMessageComposer

package com.sulake.habbo.communication.messages.outgoing.friendlist{
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.core.runtime.IDisposable;

    [SecureSWF(rename="true")]
    public class DeclineFriendMessageComposer implements IMessageComposer, IDisposable {

        private var _declinedRequestIds:Array;

        public function DeclineFriendMessageComposer();

        public function getMessageArray():Array;

        public function addDeclinedRequest(k:int):void;

        public function dispose():void;

        public function get disposed():Boolean;


    }
}//package com.sulake.habbo.communication.messages.outgoing.friendlist

