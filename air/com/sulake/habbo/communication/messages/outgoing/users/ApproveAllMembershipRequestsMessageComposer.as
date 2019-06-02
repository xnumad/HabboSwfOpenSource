//com.sulake.habbo.communication.messages.outgoing.users.ApproveAllMembershipRequestsMessageComposer

package com.sulake.habbo.communication.messages.outgoing.users{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class ApproveAllMembershipRequestsMessageComposer implements IMessageComposer {

        private var _data:Array;

        public function ApproveAllMembershipRequestsMessageComposer(k:int);

        public function getMessageArray():Array;

        public function dispose():void;


    }
}//package com.sulake.habbo.communication.messages.outgoing.users

