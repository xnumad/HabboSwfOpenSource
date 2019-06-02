//com.sulake.habbo.communication.messages.outgoing.users.RejectMembershipRequestMessageComposer

package com.sulake.habbo.communication.messages.outgoing.users{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class RejectMembershipRequestMessageComposer implements IMessageComposer {

        private var _data:Array;

        public function RejectMembershipRequestMessageComposer(k:int, _arg_2:int);

        public function getMessageArray():Array;

        public function dispose():void;


    }
}//package com.sulake.habbo.communication.messages.outgoing.users

