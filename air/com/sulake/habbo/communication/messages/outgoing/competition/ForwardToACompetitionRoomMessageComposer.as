//com.sulake.habbo.communication.messages.outgoing.competition.ForwardToACompetitionRoomMessageComposer

package com.sulake.habbo.communication.messages.outgoing.competition{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class ForwardToACompetitionRoomMessageComposer implements IMessageComposer {

        private var _array:Array;

        public function ForwardToACompetitionRoomMessageComposer(k:String, _arg_2:int);

        public function getMessageArray():Array;

        public function dispose():void;

        public function get disposed():Boolean;


    }
}//package com.sulake.habbo.communication.messages.outgoing.competition

