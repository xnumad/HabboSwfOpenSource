//com.sulake.habbo.communication.messages.outgoing.competition.ForwardToASubmittableRoomMessageComposer

package com.sulake.habbo.communication.messages.outgoing.competition{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class ForwardToASubmittableRoomMessageComposer implements IMessageComposer {

        public function ForwardToASubmittableRoomMessageComposer();

        public function getMessageArray():Array;

        public function dispose():void;

        public function get disposed():Boolean;


    }
}//package com.sulake.habbo.communication.messages.outgoing.competition

