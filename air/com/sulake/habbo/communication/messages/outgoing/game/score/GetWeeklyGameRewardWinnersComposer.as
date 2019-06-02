//com.sulake.habbo.communication.messages.outgoing.game.score.GetWeeklyGameRewardWinnersComposer

package com.sulake.habbo.communication.messages.outgoing.game.score{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class GetWeeklyGameRewardWinnersComposer implements IMessageComposer {

        private var _data:Array;

        public function GetWeeklyGameRewardWinnersComposer(k:int);

        public function getMessageArray():Array;

        public function dispose():void;


    }
}//package com.sulake.habbo.communication.messages.outgoing.game.score

