//com.sulake.habbo.room.utils.RoomObjectLocationValidator

package com.sulake.habbo.room.utils{
    import com.sulake.room.object.IRoomObject;
    import com.sulake.room.utils.IVector3d;
    import com.sulake.room.utils.Vector3d;
    import com.sulake.habbo.room.IFurniStackingHeightMap;

    public class RoomObjectLocationValidator {

        public function RoomObjectLocationValidator();

        public static function validateWallItemLocation(k:IRoomObject, _arg_2:IVector3d, _arg_3:IVector3d, _arg_4:IVector3d, _arg_5:Number, _arg_6:Number):Vector3d;

        public static function validateFurnitureDirection(k:IRoomObject, _arg_2:IVector3d, _arg_3:IFurniStackingHeightMap):Boolean;

        public static function validateFurnitureLocation(k:IRoomObject, _arg_2:IVector3d, _arg_3:IVector3d, _arg_4:IVector3d, _arg_5:IFurniStackingHeightMap):Vector3d;


    }
}//package com.sulake.habbo.room.utils

