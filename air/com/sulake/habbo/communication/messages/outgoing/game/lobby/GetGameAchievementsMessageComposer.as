//com.sulake.habbo.communication.messages.outgoing.game.lobby.GetGameAchievementsMessageComposer

package com.sulake.habbo.communication.messages.outgoing.game.lobby{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class GetGameAchievementsMessageComposer implements IMessageComposer {

        public function GetGameAchievementsMessageComposer();

        public function getMessageArray():Array;

        public function dispose():void;


    }
}//package com.sulake.habbo.communication.messages.outgoing.game.lobby

