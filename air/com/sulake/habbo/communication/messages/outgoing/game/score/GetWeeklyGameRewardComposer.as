//com.sulake.habbo.communication.messages.outgoing.game.score.GetWeeklyGameRewardComposer

package com.sulake.habbo.communication.messages.outgoing.game.score{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class GetWeeklyGameRewardComposer implements IMessageComposer {

        private var _data:Array;

        public function GetWeeklyGameRewardComposer(k:int);

        public function getMessageArray():Array;

        public function dispose():void;


    }
}//package com.sulake.habbo.communication.messages.outgoing.game.score

