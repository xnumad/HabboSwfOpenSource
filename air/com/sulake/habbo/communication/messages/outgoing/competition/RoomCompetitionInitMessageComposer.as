//com.sulake.habbo.communication.messages.outgoing.competition.RoomCompetitionInitMessageComposer

package com.sulake.habbo.communication.messages.outgoing.competition{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class RoomCompetitionInitMessageComposer implements IMessageComposer {

        public function RoomCompetitionInitMessageComposer();

        public function getMessageArray():Array;

        public function dispose():void;


    }
}//package com.sulake.habbo.communication.messages.outgoing.competition

