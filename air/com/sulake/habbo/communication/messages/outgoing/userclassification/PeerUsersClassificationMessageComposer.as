//com.sulake.habbo.communication.messages.outgoing.userclassification.PeerUsersClassificationMessageComposer

package com.sulake.habbo.communication.messages.outgoing.userclassification{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class PeerUsersClassificationMessageComposer implements IMessageComposer {

        private var userClassType:String;

        public function PeerUsersClassificationMessageComposer(k:String);

        public function getMessageArray():Array;

        public function dispose():void;


    }
}//package com.sulake.habbo.communication.messages.outgoing.userclassification

