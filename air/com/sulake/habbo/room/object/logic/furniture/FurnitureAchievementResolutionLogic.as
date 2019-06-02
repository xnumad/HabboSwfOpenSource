//com.sulake.habbo.room.object.logic.furniture.FurnitureAchievementResolutionLogic

package com.sulake.habbo.room.object.logic.furniture{
    import com.sulake.room.messages.RoomObjectUpdateMessage;

    public class FurnitureAchievementResolutionLogic extends FurnitureBadgeDisplayLogic {

        public static const STATE_RESOLUTION_NOT_STARTED:int;
        public static const STATE_RESOLUTION_IN_PROGRESS:int;
        public static const STATE_RESOLUTION_ACHIEVED:int;
        public static const STATE_RESOLUTION_FAILED:int;
        private static const ACH_NOT_SET:String;
        private static const BADGE_VISIBLE_IN_STATE:Number;

        public function FurnitureAchievementResolutionLogic();

        override public function getEventTypes():Array;

        override public function processUpdateMessage(k:RoomObjectUpdateMessage):void;

        override public function useObject():void;

        override protected function updateBadge(k:String):void;


    }
}//package com.sulake.habbo.room.object.logic.furniture

