//com.sulake.habbo.communication.messages.parser.inventory.achievements.AchievementsMessageParser

package com.sulake.habbo.communication.messages.parser.inventory.achievements{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class AchievementsMessageParser implements IMessageParser {

        private var _achievements:Array;
        private var _defaultCategory:String;

        public function AchievementsMessageParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;

        public function get achievements():Array;

        public function get defaultCategory():String;


    }
}//package com.sulake.habbo.communication.messages.parser.inventory.achievements

