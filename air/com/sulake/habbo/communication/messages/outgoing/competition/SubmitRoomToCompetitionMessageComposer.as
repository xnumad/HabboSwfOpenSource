//com.sulake.habbo.communication.messages.outgoing.competition.SubmitRoomToCompetitionMessageComposer

package com.sulake.habbo.communication.messages.outgoing.competition{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class SubmitRoomToCompetitionMessageComposer implements IMessageComposer {

        public static const CONFIRM_LEVEL_NOT_ACCEPTED:int;
        public static const CONFIRM_LEVEL_NOT_SUBMITTED:int;
        public static const CONFIRM_LEVEL_NOT_CONFIRMED:int;
        public static const CONFIRM_LEVEL_COMMIT:int;

        private var _data:Array;

        public function SubmitRoomToCompetitionMessageComposer(k:String, _arg_2:int);

        public function getMessageArray():Array;

        public function dispose():void;


    }
}//package com.sulake.habbo.communication.messages.outgoing.competition

