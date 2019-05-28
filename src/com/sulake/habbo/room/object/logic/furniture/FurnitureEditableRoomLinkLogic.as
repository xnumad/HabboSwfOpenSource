package com.sulake.habbo.room.object.logic.furniture
{
    import com.sulake.habbo.room.object.RoomObjectVariableEnum;
    import com.sulake.room.object.IRoomObjectModelController;
    import com.sulake.habbo.room.events.RoomObjectWidgetRequestEvent;
    import flash.utils.Timer;
    import flash.events.TimerEvent;

    public class FurnitureEditableRoomLinkLogic extends FurnitureLogic 
    {


        override public function initialize(k:XML):void
        {
            super.initialize(k);
            if (k == null)
            {
                return;
            }
            var _local_2:XMLList = k.action;
            if (_local_2.length() != 0)
            {
                object.getModelController().setString(RoomObjectVariableEnum.FURNITURE_INTERNAL_LINK, _local_2.@link);
            }
        }

        public function _Str_6210(k:int):void
        {
            if (object == null)
            {
                return;
            }
            var _local_2:IRoomObjectModelController = object.getModelController();
            if (_local_2 != null)
            {
                _local_2.setNumber(RoomObjectVariableEnum.FURNITURE_AUTOMATIC_STATE_INDEX, k, false);
            }
        }

        override public function getEventTypes():Array
        {
            return getAllEventTypes(super.getEventTypes(), [RoomObjectWidgetRequestEvent.ROOM_LINK]);
        }

        override public function useObject():void
        {
            this._Str_6210(1);
            var k:Timer = new Timer(2500);
            k.addEventListener(TimerEvent.TIMER, this._Str_24963);
            k.start();
            if (((!(eventDispatcher == null)) && (!(object == null))))
            {
                eventDispatcher.dispatchEvent(new RoomObjectWidgetRequestEvent(RoomObjectWidgetRequestEvent.ROOM_LINK, object));
            }
        }

        private function _Str_24963(k:TimerEvent):void
        {
            this._Str_6210(0);
        }
    }
}
