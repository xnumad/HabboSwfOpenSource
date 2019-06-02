package com.sulake.habbo.room.object.logic.furniture
{
    import com.sulake.habbo.room.events.RoomObjectWidgetRequestEvent;
    import com.sulake.habbo.room.events.RoomObjectBadgeAssetEvent;
    import com.sulake.room.events.RoomObjectEvent;
    import com.sulake.habbo.room.messages.RoomObjectGroupBadgeUpdateMessage;
    import com.sulake.habbo.room.object.RoomObjectVariableEnum;
    import com.sulake.habbo.room.messages.RoomObjectSelectedMessage;
    import com.sulake.room.messages.RoomObjectUpdateMessage;

    public class FurnitureAchievementResolutionLogic extends FurnitureBadgeDisplayLogic 
    {
        public static const STATE_RESOLUTION_NOT_STARTED:int = 0;
        public static const STATE_RESOLUTION_IN_PROGRESS:int = 1;
        public static const STATE_RESOLUTION_ACHIEVED:int = 2;
        public static const STATE_RESOLUTION_FAILED:int = 3;
        private static const ACH_NOT_SET:String = "ACH_0";
        private static const BADGE_VISIBLE_IN_STATE:Number = 2;


        override public function getEventTypes():Array
        {
            var k:Array = [RoomObjectWidgetRequestEvent.ACHIEVEMENT_RESOLUTION_OPEN, RoomObjectWidgetRequestEvent.ACHIEVEMENT_RESOLUTION_ENGRAVING, RoomObjectWidgetRequestEvent.ACHIEVEMENT_RESOLUTION_FAILED, RoomObjectBadgeAssetEvent.ROGBE_LOAD_BADGE];
            return getAllEventTypes(super.getEventTypes(), k);
        }

        override public function processUpdateMessage(k:RoomObjectUpdateMessage):void
        {
            var _local_4:RoomObjectEvent;
            super.processUpdateMessage(k);
            var _local_2:RoomObjectGroupBadgeUpdateMessage = (k as RoomObjectGroupBadgeUpdateMessage);
            if (_local_2 != null)
            {
                if (_local_2.assetName != "loading_icon")
                {
                    object.getModelController().setNumber(RoomObjectVariableEnum.FURNITURE_BADGE_VISIBLE_IN_STATE, BADGE_VISIBLE_IN_STATE);
                }
            }
            var _local_3:RoomObjectSelectedMessage = (k as RoomObjectSelectedMessage);
            if (_local_3)
            {
                if (((!(eventDispatcher == null)) && (!(object == null))))
                {
                    if (!_local_3.selected)
                    {
                        _local_4 = new RoomObjectWidgetRequestEvent(RoomObjectWidgetRequestEvent.CLOSE_FURNI_CONTEXT_MENU, object);
                        eventDispatcher.dispatchEvent(_local_4);
                    }
                }
            }
        }

        override public function useObject():void
        {
            var k:RoomObjectEvent;
            if (((!(eventDispatcher == null)) && (!(object == null))))
            {
                k = null;
                switch (object.getState(0))
                {
                    case STATE_RESOLUTION_NOT_STARTED:
                    case STATE_RESOLUTION_IN_PROGRESS:
                        k = new RoomObjectWidgetRequestEvent(RoomObjectWidgetRequestEvent.ACHIEVEMENT_RESOLUTION_OPEN, object);
                        break;
                    case STATE_RESOLUTION_ACHIEVED:
                        k = new RoomObjectWidgetRequestEvent(RoomObjectWidgetRequestEvent.ACHIEVEMENT_RESOLUTION_ENGRAVING, object);
                        break;
                    case STATE_RESOLUTION_FAILED:
                        k = new RoomObjectWidgetRequestEvent(RoomObjectWidgetRequestEvent.ACHIEVEMENT_RESOLUTION_FAILED, object);
                        break;
                }
                if (k)
                {
                    eventDispatcher.dispatchEvent(k);
                }
            }
        }

        override protected function updateBadge(k:String):void
        {
            if (k != ACH_NOT_SET)
            {
                super.updateBadge(k);
            }
        }
    }
}
