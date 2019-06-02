//com.sulake.habbo.communication.messages.parser.game.lobby.AchievementResolutionsMessageParser

package com.sulake.habbo.communication.messages.parser.game.lobby{
    import com.sulake.core.communication.messages.IMessageParser;
    import __AS3__.vec.Vector;
    import com.sulake.habbo.communication.messages.incoming.inventory.achievements.AchievementResolutionData;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class AchievementResolutionsMessageParser implements IMessageParser {

        private var _stuffId:int;
        private var _achievements:Vector.<AchievementResolutionData>;
        private var _endTime:int;

        public function AchievementResolutionsMessageParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;

        public function get stuffId():int;

        public function get achievements():Vector.<AchievementResolutionData>;

        public function get endTime():int;


    }
}//package com.sulake.habbo.communication.messages.parser.game.lobby

