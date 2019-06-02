//com.sulake.habbo.communication.messages.parser.game.lobby.AchievementResolutionCompletedMessageParser

package com.sulake.habbo.communication.messages.parser.game.lobby{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class AchievementResolutionCompletedMessageParser implements IMessageParser {

        private var _stuffCode:String;
        private var _badgeCode:String;

        public function AchievementResolutionCompletedMessageParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;

        public function get stuffCode():String;

        public function get badgeCode():String;


    }
}//package com.sulake.habbo.communication.messages.parser.game.lobby

