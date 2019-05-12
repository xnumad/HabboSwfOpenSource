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
        public static const _Str_18949:int = 0;
        public static const _Str_18523:int = 1;
        public static const _Str_17739:int = 2;
        public static const _Str_18385:int = 3;
        private static const _Str_16199:String = "ACH_0";
        private static const _Str_16076:Number = 2;


        override public function getEventTypes():Array
        {
            var k:Array = [RoomObjectWidgetRequestEvent.ACHIEVEMENT_RESOLUTION_OPEN, RoomObjectWidgetRequestEvent.ACHIEVEMENT_RESOLUTION_ENGRAVING, RoomObjectWidgetRequestEvent.ACHIEVEMENT_RESOLUTION_FAILED, RoomObjectBadgeAssetEvent.ROGBE_LOAD_BADGE];
            return _Str_2414(super.getEventTypes(), k);
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
                    object.getModelController().setNumber(RoomObjectVariableEnum.FURNITURE_BADGE_VISIBLE_IN_STATE, _Str_16076);
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
                    case _Str_18949:
                    case _Str_18523:
                        k = new RoomObjectWidgetRequestEvent(RoomObjectWidgetRequestEvent.ACHIEVEMENT_RESOLUTION_OPEN, object);
                        break;
                    case _Str_17739:
                        k = new RoomObjectWidgetRequestEvent(RoomObjectWidgetRequestEvent.ACHIEVEMENT_RESOLUTION_ENGRAVING, object);
                        break;
                    case _Str_18385:
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
            if (k != _Str_16199)
            {
                super.updateBadge(k);
            }
        }
    }
}
