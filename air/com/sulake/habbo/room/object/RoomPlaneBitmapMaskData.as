//com.sulake.habbo.room.object.RoomPlaneBitmapMaskData

package com.sulake.habbo.room.object{
    import com.sulake.room.utils.Vector3d;
    import com.sulake.room.utils.IVector3d;

    public class RoomPlaneBitmapMaskData {

        public static const MASK_CATEGORY_WINDOW:String;
        public static const MASK_CATEGORY_HOLE:String;

        private var _loc:Vector3d;
        private var _type:String;
        private var _category:String;

        public function RoomPlaneBitmapMaskData(k:String, _arg_2:IVector3d, _arg_3:String);

        public function get loc():IVector3d;

        public function set loc(k:IVector3d):void;

        public function get type():String;

        public function set type(k:String):void;

        public function get category():String;

        public function set category(k:String):void;

        public function dispose():void;


    }
}//package com.sulake.habbo.room.object

