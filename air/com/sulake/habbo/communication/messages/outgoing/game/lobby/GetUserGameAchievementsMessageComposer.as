//com.sulake.habbo.communication.messages.outgoing.game.lobby.GetUserGameAchievementsMessageComposer

package com.sulake.habbo.communication.messages.outgoing.game.lobby{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class GetUserGameAchievementsMessageComposer implements IMessageComposer {

        private var _gameTypeId:int;

        public function GetUserGameAchievementsMessageComposer(k:int);

        public function getMessageArray():Array;

        public function dispose():void;


    }
}//package com.sulake.habbo.communication.messages.outgoing.game.lobby

