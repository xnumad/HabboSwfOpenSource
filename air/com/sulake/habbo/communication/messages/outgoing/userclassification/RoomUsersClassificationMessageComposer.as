//com.sulake.habbo.communication.messages.outgoing.userclassification.RoomUsersClassificationMessageComposer

package com.sulake.habbo.communication.messages.outgoing.userclassification{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class RoomUsersClassificationMessageComposer implements IMessageComposer {

        private var userClassType:String;

        public function RoomUsersClassificationMessageComposer(k:String);

        public function getMessageArray():Array;

        public function dispose():void;


    }
}//package com.sulake.habbo.communication.messages.outgoing.userclassification

