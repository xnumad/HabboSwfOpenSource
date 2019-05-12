package com.sulake.habbo.room.object.logic.furniture
{
    import com.sulake.room.object.IRoomObjectModelController;
    import com.sulake.habbo.room.object.RoomObjectVariableEnum;

    public class FurniturePlanetSystemLogic extends FurnitureLogic 
    {


        override public function initialize(k:XML):void
        {
            var _local_3:IRoomObjectModelController;
            super.initialize(k);
            if (k == null)
            {
                return;
            }
            var _local_2:XMLList = k.planetsystem;
            if (_local_2.length() == 0)
            {
                return;
            }
            if (object != null)
            {
                _local_3 = object.getModelController();
                if (_local_3 != null)
                {
                    _local_3.setString(RoomObjectVariableEnum.FURNITURE_PLANETSYSTEM_DATA, String(_local_2));
                }
            }
        }
    }
}
