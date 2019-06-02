//com.sulake.habbo.communication.messages.outgoing.quest.GetCommunityGoalEarnedPrizesMessageComposer

package com.sulake.habbo.communication.messages.outgoing.quest{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class GetCommunityGoalEarnedPrizesMessageComposer implements IMessageComposer {

        public function GetCommunityGoalEarnedPrizesMessageComposer();

        public function dispose():void;

        public function getMessageArray():Array;


    }
}//package com.sulake.habbo.communication.messages.outgoing.quest

