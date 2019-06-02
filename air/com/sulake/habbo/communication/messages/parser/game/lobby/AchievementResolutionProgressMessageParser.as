//com.sulake.habbo.communication.messages.parser.game.lobby.AchievementResolutionProgressMessageParser

package com.sulake.habbo.communication.messages.parser.game.lobby{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class AchievementResolutionProgressMessageParser implements IMessageParser {

        private var _stuffId:int;
        private var _achievementId:int;
        private var _requiredLevelBadgeCode:String;
        private var _userProgress:int;
        private var _totalProgress:int;
        private var _endTime:int;

        public function AchievementResolutionProgressMessageParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;

        public function get stuffId():int;

        public function get achievementId():int;

        public function get requiredLevelBadgeCode():String;

        public function get userProgress():int;

        public function get totalProgress():int;

        public function get endTime():int;


    }
}//package com.sulake.habbo.communication.messages.parser.game.lobby

