//com.sulake.habbo.communication.messages.incoming.inventory.achievements.AchievementResolutionData

package com.sulake.habbo.communication.messages.incoming.inventory.achievements{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class AchievementResolutionData {

        public static const STATE_SELECTABLE:int;

        private var _achievementId:int;
        private var _level:int;
        private var _badgeId:String;
        private var _requiredLevel:int;
        private var _state:int;

        public function AchievementResolutionData(k:IMessageDataWrapper);

        public function dispose():void;

        public function get achievementId():int;

        public function get level():int;

        public function get badgeId():String;

        public function get requiredLevel():int;

        public function get enabled():Boolean;

        public function get state():int;


    }
}//package com.sulake.habbo.communication.messages.incoming.inventory.achievements

