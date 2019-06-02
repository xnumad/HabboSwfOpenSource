//com.sulake.habbo.communication.messages.parser.game.lobby.GameAchievementsMessageParser

package com.sulake.habbo.communication.messages.parser.game.lobby{
    import com.sulake.core.communication.messages.IMessageParser;
    import __AS3__.vec.Vector;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class GameAchievementsMessageParser implements IMessageParser {

        private var _achievements:Vector.<GameAchievementData>;

        public function GameAchievementsMessageParser();

        public function flush():Boolean;

        public function get achievements():Vector.<GameAchievementData>;

        public function parse(k:IMessageDataWrapper):Boolean;


    }
}//package com.sulake.habbo.communication.messages.parser.game.lobby

