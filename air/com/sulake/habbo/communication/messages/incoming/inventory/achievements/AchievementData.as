//com.sulake.habbo.communication.messages.incoming.inventory.achievements.AchievementData

package com.sulake.habbo.communication.messages.incoming.inventory.achievements{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class AchievementData {

        public static const DISPLAY_METHOD_OBSOLETE:int;
        public static const DISPLAY_METHOD_SHOW_LEVEL_PROGRESS:int;
        public static const DISPLAY_METHOD_NEVER_SHOW_PROGRESS:int;
        public static const DISPLAY_METHOD_SHOW_TOTAL_PROGRESS:int;

        private var _achievementId:int;
        private var _level:int;
        private var _badgeId:String;
        private var _scoreAtStartOfLevel:int;
        private var _scoreLimit:int;
        private var _levelRewardPoints:int;
        private var _levelRewardPointType:int;
        private var _currentPoints:int;
        private var _finalLevel:Boolean;
        private var _category:String;
        private var _subCategory:String;
        private var _levelCount:int;
        private var _displayMethod:int;

        public function AchievementData(k:IMessageDataWrapper);

        public function get achievementId():int;

        public function get badgeId():String;

        public function get level():int;

        public function get scoreAtStartOfLevel():int;

        public function get scoreLimit():int;

        public function get levelRewardPoints():int;

        public function get levelRewardPointType():int;

        public function get currentPoints():int;

        public function get finalLevel():Boolean;

        public function get category():String;

        public function get subCategory():String;

        public function get levelCount():int;

        public function get firstLevelAchieved():Boolean;

        public function setMaxProgress():void;

        public function get displayMethod():int;


    }
}//package com.sulake.habbo.communication.messages.incoming.inventory.achievements

