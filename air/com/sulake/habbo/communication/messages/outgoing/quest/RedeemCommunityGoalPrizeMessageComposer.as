//com.sulake.habbo.communication.messages.outgoing.quest.RedeemCommunityGoalPrizeMessageComposer

package com.sulake.habbo.communication.messages.outgoing.quest{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class RedeemCommunityGoalPrizeMessageComposer implements IMessageComposer {

        private var _data:Array;

        public function RedeemCommunityGoalPrizeMessageComposer(k:int);

        public function getMessageArray():Array;

        public function dispose():void;


    }
}//package com.sulake.habbo.communication.messages.outgoing.quest

