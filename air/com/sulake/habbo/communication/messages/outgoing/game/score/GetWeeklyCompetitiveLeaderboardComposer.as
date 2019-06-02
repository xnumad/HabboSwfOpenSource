//com.sulake.habbo.communication.messages.outgoing.game.score.GetWeeklyCompetitiveLeaderboardComposer

package com.sulake.habbo.communication.messages.outgoing.game.score{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class GetWeeklyCompetitiveLeaderboardComposer implements IMessageComposer {

        private var _data:Array;

        public function GetWeeklyCompetitiveLeaderboardComposer(k:int, _arg_2:int);

        public function getMessageArray():Array;

        public function dispose():void;


    }
}//package com.sulake.habbo.communication.messages.outgoing.game.score

