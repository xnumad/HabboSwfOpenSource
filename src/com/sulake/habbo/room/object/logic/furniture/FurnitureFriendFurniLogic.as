package com.sulake.habbo.room.object.logic.furniture
{
    import com.sulake.habbo.ui.widget.enums.ContextMenuEnum;
    import com.sulake.habbo.room.events.RoomObjectWidgetRequestEvent;
    import com.sulake.habbo.room.object.RoomObjectVariableEnum;
    import com.sulake.habbo.room.object.data.StringArrayStuffData;
    import com.sulake.habbo.room.messages.RoomObjectDataUpdateMessage;
    import com.sulake.room.messages.RoomObjectUpdateMessage;

    public class FurnitureFriendFurniLogic extends FurnitureMultistateLogic 
    {
        private static const STATE_UNINITIALIZED:int = -1;
        private static const STATE_UNLOCKED:int = 0;
        private static const STATE_LOCKED:int = 1;

        private var _state:int = -1;


        protected function get engravingDialogType():int
        {
            return 0;
        }

        override public function get contextMenu():String
        {
            return (this._state == STATE_UNLOCKED) ? ContextMenuEnum.FRIEND_FURNITURE : ContextMenuEnum.DUMMY;
        }

        override public function getEventTypes():Array
        {
            return getAllEventTypes(super.getEventTypes(), [RoomObjectWidgetRequestEvent.FRIEND_FURNITURE_ENGRAVING]);
        }

        override public function initialize(k:XML):void
        {
            super.initialize(k);
            object.getModelController().setNumber(RoomObjectVariableEnum.FURNITURE_FRIENDFURNI_ENGRAVING_TYPE, this.engravingDialogType);
        }

        override public function processUpdateMessage(k:RoomObjectUpdateMessage):void
        {
            var _local_3:StringArrayStuffData;
            var _local_2:RoomObjectDataUpdateMessage = (k as RoomObjectDataUpdateMessage);
            if (_local_2 != null)
            {
                _local_3 = (_local_2.data as StringArrayStuffData);
                if (_local_3 != null)
                {
                    this._state = _local_3.state;
                }
                else
                {
                    this._state = _local_2.state;
                }
            }
            super.processUpdateMessage(k);
        }

        override public function useObject():void
        {
            if (((!(eventDispatcher == null)) && (!(object == null))))
            {
                if (this._state == STATE_LOCKED)
                {
                    eventDispatcher.dispatchEvent(new RoomObjectWidgetRequestEvent(RoomObjectWidgetRequestEvent.FRIEND_FURNITURE_ENGRAVING, object));
                }
                else
                {
                    super.useObject();
                }
            }
        }
    }
}
