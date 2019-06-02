//com.sulake.habbo.communication.messages.outgoing.inventory.achievements.GetAchievementsComposer

package com.sulake.habbo.communication.messages.outgoing.inventory.achievements{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class GetAchievementsComposer implements IMessageComposer {

        public function GetAchievementsComposer();

        public function dispose():void;

        public function getMessageArray():Array;


    }
}//package com.sulake.habbo.communication.messages.outgoing.inventory.achievements

