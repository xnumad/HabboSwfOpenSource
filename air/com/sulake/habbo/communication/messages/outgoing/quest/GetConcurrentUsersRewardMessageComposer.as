//com.sulake.habbo.communication.messages.outgoing.quest.GetConcurrentUsersRewardMessageComposer

package com.sulake.habbo.communication.messages.outgoing.quest{
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.core.runtime.IDisposable;

    [SecureSWF(rename="true")]
    public class GetConcurrentUsersRewardMessageComposer implements IMessageComposer, IDisposable {

        public function GetConcurrentUsersRewardMessageComposer();

        public function get disposed():Boolean;

        public function getMessageArray():Array;

        public function dispose():void;


    }
}//package com.sulake.habbo.communication.messages.outgoing.quest

