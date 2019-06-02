//com.sulake.habbo.communication.messages.incoming.notifications.AchievementLevelUpData

package com.sulake.habbo.communication.messages.incoming.notifications{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class AchievementLevelUpData {

        private var _type:int;
        private var _level:int;
        private var _points:int;
        private var _levelRewardPoints:int;
        private var _levelRewardPointType:int;
        private var _bonusPoints:int;
        private var _badgeId:int;
        private var _badgeCode:String;
        private var _removedBadgeCode:String;
        private var _achievementID:int;
        private var _category:String;
        private var _showDialogToUser:Boolean;

        public function AchievementLevelUpData(k:IMessageDataWrapper);

        public function get type():int;

        public function get level():int;

        public function get points():int;

        public function get levelRewardPoints():int;

        public function get levelRewardPointType():int;

        public function get bonusPoints():int;

        public function get badgeId():int;

        public function get badgeCode():String;

        public function get removedBadgeCode():String;

        public function get achievementID():int;

        public function get category():String;

        public function get showDialogToUser():Boolean;


    }
}//package com.sulake.habbo.communication.messages.incoming.notifications

