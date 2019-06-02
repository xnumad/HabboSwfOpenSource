//com.sulake.habbo.room.object.RoomPlaneBitmapMaskParser

package com.sulake.habbo.room.object{
    import com.sulake.core.utils.Map;
    import com.sulake.room.utils.IVector3d;

    public class RoomPlaneBitmapMaskParser {

        private var _masks:Map;

        public function RoomPlaneBitmapMaskParser();

        public function get maskCount():int;

        public function dispose():void;

        public function initialize(k:XML):Boolean;

        public function reset():void;

        public function addMask(k:String, _arg_2:String, _arg_3:IVector3d, _arg_4:String):void;

        public function removeMask(k:String):Boolean;

        public function getXML():XML;

        public function getMaskLocation(k:int):IVector3d;

        public function getMaskType(k:int):String;

        public function getMaskCategory(k:int):String;


    }
}//package com.sulake.habbo.room.object

