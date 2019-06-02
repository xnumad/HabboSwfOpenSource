//com.sulake.habbo.communication.messages.parser.inventory.badges.BadgesParser

package com.sulake.habbo.communication.messages.parser.inventory.badges{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.utils.Map;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class BadgesParser implements IMessageParser {

        private var _allBadgeCodes:Array;
        private var _activeBadgeCodes:Array;
        private var _badgeIds:Map;

        public function BadgesParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;

        public function getBadgeId(k:String):int;

        public function getBadgeIdMap():Map;

        public function getAllBadgeCodes():Array;

        public function getActiveBadgeCodes():Array;


    }
}//package com.sulake.habbo.communication.messages.parser.inventory.badges

