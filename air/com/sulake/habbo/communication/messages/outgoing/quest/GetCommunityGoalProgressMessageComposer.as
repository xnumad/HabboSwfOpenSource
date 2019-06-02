//com.sulake.habbo.communication.messages.outgoing.quest.GetCommunityGoalProgressMessageComposer

package com.sulake.habbo.communication.messages.outgoing.quest{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class GetCommunityGoalProgressMessageComposer implements IMessageComposer {

        public function GetCommunityGoalProgressMessageComposer();

        public function getMessageArray():Array;

        public function dispose():void;


    }
}//package com.sulake.habbo.communication.messages.outgoing.quest

