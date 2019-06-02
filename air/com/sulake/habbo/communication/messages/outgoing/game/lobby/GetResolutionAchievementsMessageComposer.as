//com.sulake.habbo.communication.messages.outgoing.game.lobby.GetResolutionAchievementsMessageComposer

package com.sulake.habbo.communication.messages.outgoing.game.lobby{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class GetResolutionAchievementsMessageComposer implements IMessageComposer {

        private var _data:Array;

        public function GetResolutionAchievementsMessageComposer(k:int, _arg_2:int=0);

        public function getMessageArray():Array;

        public function dispose():void;


    }
}//package com.sulake.habbo.communication.messages.outgoing.game.lobby

