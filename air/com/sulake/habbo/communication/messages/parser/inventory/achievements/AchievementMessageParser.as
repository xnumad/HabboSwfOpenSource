//com.sulake.habbo.communication.messages.parser.inventory.achievements.AchievementMessageParser

package com.sulake.habbo.communication.messages.parser.inventory.achievements{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.habbo.communication.messages.incoming.inventory.achievements.AchievementData;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class AchievementMessageParser implements IMessageParser {

        private var _achievement:AchievementData;

        public function AchievementMessageParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;

        public function get achievement():AchievementData;


    }
}//package com.sulake.habbo.communication.messages.parser.inventory.achievements

