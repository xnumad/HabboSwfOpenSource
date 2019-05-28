package com.sulake.habbo.room.object.logic.furniture
{
    import com.sulake.habbo.room.events.RoomObjectBadgeAssetEvent;
    import com.sulake.habbo.room.events.RoomObjectWidgetRequestEvent;
    import com.sulake.habbo.room.object.data.StringArrayStuffData;
    import com.sulake.room.events.RoomObjectEvent;
    import com.sulake.habbo.room.messages.RoomObjectDataUpdateMessage;
    import com.sulake.habbo.room.messages.RoomObjectGroupBadgeUpdateMessage;
    import com.sulake.habbo.room.object.RoomObjectVariableEnum;
    import flash.utils.getTimer;
    import com.sulake.habbo.room.messages.RoomObjectSelectedMessage;
    import com.sulake.room.messages.RoomObjectUpdateMessage;
    import flash.events.MouseEvent;
    import com.sulake.room.events.RoomSpriteMouseEvent;
    import com.sulake.room.utils.IRoomGeometry;

    public class FurnitureGuildCustomizedLogic extends FurnitureMultistateLogic 
    {
        public static const _Str_18293:int = 1;
        public static const _Str_17707:int = 2;
        public static const COLOR_1_STUFFDATA_KEY:int = 3;
        public static const COLOR_2_STUFFDATA_KEY:int = 4;


        override public function getEventTypes():Array
        {
            var k:Array = [RoomObjectBadgeAssetEvent.ROGBE_LOAD_BADGE, RoomObjectWidgetRequestEvent.GUILD_FURNI_CONTEXT_MENU, RoomObjectWidgetRequestEvent.CLOSE_FURNI_CONTEXT_MENU];
            return getAllEventTypes(super.getEventTypes(), k);
        }

        override public function processUpdateMessage(k:RoomObjectUpdateMessage):void
        {
            var _local_5:StringArrayStuffData;
            var _local_6:RoomObjectEvent;
            super.processUpdateMessage(k);
            var _local_2:RoomObjectDataUpdateMessage = (k as RoomObjectDataUpdateMessage);
            if (_local_2 != null)
            {
                _local_5 = (_local_2.data as StringArrayStuffData);
                if (_local_5 != null)
                {
                    this.updateGuildId(_local_5.getValue(_Str_18293));
                    this._Str_25639(_local_5.getValue(_Str_17707));
                    this._Str_24747(_local_5.getValue(COLOR_1_STUFFDATA_KEY), _local_5.getValue(COLOR_2_STUFFDATA_KEY));
                }
            }
            var _local_3:RoomObjectGroupBadgeUpdateMessage = (k as RoomObjectGroupBadgeUpdateMessage);
            if (_local_3 != null)
            {
                if (_local_3.assetName != "loading_icon")
                {
                    object.getModelController().setString(RoomObjectVariableEnum.FURNITURE_GUILD_CUSTOMIZED_ASSET_NAME, _local_3.assetName);
                    this.update(getTimer());
                }
            }
            var _local_4:RoomObjectSelectedMessage = (k as RoomObjectSelectedMessage);
            if (_local_4)
            {
                if (((!(eventDispatcher == null)) && (!(object == null))))
                {
                    if (!_local_4.selected)
                    {
                        _local_6 = new RoomObjectWidgetRequestEvent(RoomObjectWidgetRequestEvent.CLOSE_FURNI_CONTEXT_MENU, object);
                        eventDispatcher.dispatchEvent(_local_6);
                    }
                }
            }
        }

        override public function mouseEvent(k:RoomSpriteMouseEvent, _arg_2:IRoomGeometry):void
        {
            if (((k == null) || (_arg_2 == null)))
            {
                return;
            }
            if (object == null)
            {
                return;
            }
            switch (k.type)
            {
                case MouseEvent.CLICK:
                    this.openContextMenu();
                default:
                    super.mouseEvent(k, _arg_2);
            }
        }

        protected function openContextMenu():void
        {
            var k:RoomObjectEvent = new RoomObjectWidgetRequestEvent(RoomObjectWidgetRequestEvent.GUILD_FURNI_CONTEXT_MENU, object);
            eventDispatcher.dispatchEvent(k);
        }

        private function _Str_24747(k:String, _arg_2:String):void
        {
            object.getModelController().setNumber(RoomObjectVariableEnum.FURNITURE_GUILD_CUSTOMIZED_COLOR_1, parseInt(k, 16));
            object.getModelController().setNumber(RoomObjectVariableEnum.FURNITURE_GUILD_CUSTOMIZED_COLOR_2, parseInt(_arg_2, 16));
        }

        private function _Str_25639(k:String):void
        {
            eventDispatcher.dispatchEvent(new RoomObjectBadgeAssetEvent(RoomObjectBadgeAssetEvent.ROGBE_LOAD_BADGE, object, k, true));
        }

        protected function updateGuildId(k:String):void
        {
            object.getModelController().setNumber(RoomObjectVariableEnum.FURNITURE_GUILD_CUSTOMIZED_GUILD_ID, parseInt(k));
        }
    }
}
