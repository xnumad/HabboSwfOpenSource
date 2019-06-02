//com.sulake.habbo.communication.messages.outgoing.competition.ForwardToRandomCompetitionRoomMessageComposer

package com.sulake.habbo.communication.messages.outgoing.competition{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class ForwardToRandomCompetitionRoomMessageComposer implements IMessageComposer {

        private var _array:Array;

        public function ForwardToRandomCompetitionRoomMessageComposer(k:String);

        public function getMessageArray():Array;

        public function dispose():void;

        public function get disposed():Boolean;


    }
}//package com.sulake.habbo.communication.messages.outgoing.competition

