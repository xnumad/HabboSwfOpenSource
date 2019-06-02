//com.sulake.habbo.communication.messages.outgoing.quest.FriendRequestQuestCompleteMessageComposer

package com.sulake.habbo.communication.messages.outgoing.quest{
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.core.runtime.IDisposable;

    [SecureSWF(rename="true")]
    public class FriendRequestQuestCompleteMessageComposer implements IMessageComposer, IDisposable {

        private var _array:Array;

        public function FriendRequestQuestCompleteMessageComposer();

        public function getMessageArray():Array;

        public function dispose():void;

        public function get disposed():Boolean;


    }
}//package com.sulake.habbo.communication.messages.outgoing.quest

