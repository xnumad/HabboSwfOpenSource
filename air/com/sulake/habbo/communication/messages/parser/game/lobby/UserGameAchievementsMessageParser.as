//com.sulake.habbo.communication.messages.parser.game.lobby.UserGameAchievementsMessageParser

package com.sulake.habbo.communication.messages.parser.game.lobby{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.habbo.communication.messages.parser.inventory.achievements.AchievementsMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class UserGameAchievementsMessageParser implements IMessageParser {

        private var _gameTypeId:int;
        private var _achievements:AchievementsMessageParser;

        public function UserGameAchievementsMessageParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;

        public function get gameTypeId():int;

        public function get achievements():Array;

        public function get defaultCategory():String;


    }
}//package com.sulake.habbo.communication.messages.parser.game.lobby

