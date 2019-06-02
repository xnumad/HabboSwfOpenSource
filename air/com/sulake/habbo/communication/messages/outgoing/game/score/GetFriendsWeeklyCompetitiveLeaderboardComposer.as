//com.sulake.habbo.communication.messages.outgoing.game.score.GetFriendsWeeklyCompetitiveLeaderboardComposer

package com.sulake.habbo.communication.messages.outgoing.game.score{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class GetFriendsWeeklyCompetitiveLeaderboardComposer implements IMessageComposer {

        private var _data:Array;

        public function GetFriendsWeeklyCompetitiveLeaderboardComposer(k:int, _arg_2:int);

        public function getMessageArray():Array;

        public function dispose():void;


    }
}//package com.sulake.habbo.communication.messages.outgoing.game.score

