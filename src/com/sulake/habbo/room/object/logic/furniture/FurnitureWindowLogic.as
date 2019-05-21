package com.sulake.habbo.room.object.logic.furniture
{
    import com.sulake.room.utils.XMLValidator;
    import com.sulake.habbo.room.object.RoomObjectVariableEnum;

    public class FurnitureWindowLogic extends FurnitureMultistateLogic 
    {


        override public function initialize(k:XML):void
        {
            var _local_3:XML;
            var _local_4:String;
            super.initialize(k);
            if (k == null)
            {
                return;
            }
            var _local_2:XMLList = k.mask;
            if (_local_2.length() > 0)
            {
                _local_3 = _local_2[0];
                if (XMLValidator.checkRequiredAttributes(_local_3, ["type"]))
                {
                    _local_4 = _local_3.@type;
                    object.getModelController().setNumber(RoomObjectVariableEnum.FURNITURE_USES_PLANE_MASK, 1, true);
                    object.getModelController().setString(RoomObjectVariableEnum.FURNITURE_PLANE_MASK_TYPE, _local_4, true);
                }
            }
        }
    }
}
