package com.sulake.habbo.room.object.logic.furniture
{
    import com.sulake.habbo.room.events.RoomToObjectOwnAvatarMoveEvent;
    import com.sulake.room.utils.IVector3D;
    import com.sulake.habbo.room.object.RoomObjectVariableEnum;

    public class FurnitureChangeStateWhenStepOnLogic extends FurnitureLogic 
    {


        override public function initialize(k:XML):void
        {
            super.initialize(k);
            eventDispatcher.addEventListener(RoomToObjectOwnAvatarMoveEvent.ROAME_MOVE_TO, this._Str_19358);
        }

        override public function tearDown():void
        {
            eventDispatcher.removeEventListener(RoomToObjectOwnAvatarMoveEvent.ROAME_MOVE_TO, this._Str_19358);
            super.tearDown();
        }

        private function _Str_19358(k:RoomToObjectOwnAvatarMoveEvent):void
        {
            var _local_3:int;
            var _local_4:int;
            var _local_5:IVector3D;
            var _local_6:int;
            var _local_7:int;
            if (object == null)
            {
                return;
            }
            var _local_2:IVector3D = object.getLocation();
            if (k._Str_7569)
            {
                _local_3 = object.getModel().getNumber(RoomObjectVariableEnum.FURNITURE_SIZE_X);
                _local_4 = object.getModel().getNumber(RoomObjectVariableEnum.FURNITURE_SIZE_Y);
                _local_5 = object.getDirection();
                _local_6 = 0;
                _local_7 = ((int((_local_5.x + 45)) % 360) / 90);
                if (((_local_7 == 1) || (_local_7 == 3)))
                {
                    _local_6 = _local_3;
                    _local_3 = _local_4;
                    _local_4 = _local_6;
                }
                if ((((k._Str_7569.x >= _local_2.x) && (k._Str_7569.x < (_local_2.x + _local_3))) && ((k._Str_7569.y >= _local_2.y) && (k._Str_7569.y < (_local_2.y + _local_4)))))
                {
                    object.setState(1, 0);
                }
                else
                {
                    object.setState(0, 0);
                }
            }
        }
    }
}
