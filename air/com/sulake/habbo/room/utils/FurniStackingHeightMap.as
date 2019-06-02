//com.sulake.habbo.room.utils.FurniStackingHeightMap

package com.sulake.habbo.room.utils{
    import com.sulake.habbo.room.IFurniStackingHeightMap;
    import __AS3__.vec.Vector;

    public class FurniStackingHeightMap implements IFurniStackingHeightMap {

        private var _heightMap:Vector.<Number>;
        private var _isNotStackable:Vector.<Boolean>;
        private var _isRoomTile:Vector.<Boolean>;
        private var _width:int;
        private var _height:int;
        private var _disposed:Boolean;

        public function FurniStackingHeightMap(k:int, _arg_2:int);

        public function get disposed():Boolean;

        public function get width():int;

        public function get height():int;

        public function dispose():void;

        private function validPosition(k:int, _arg_2:int):Boolean;

        public function getTileHeight(k:int, _arg_2:int):Number;

        public function setTileHeight(k:int, _arg_2:int, _arg_3:Number):void;

        public function setStackingBlocked(k:int, _arg_2:int, _arg_3:Boolean):void;

        public function setIsRoomTile(k:int, _arg_2:int, _arg_3:Boolean):void;

        public function isRoomTile(k:int, _arg_2:int):Boolean;

        public function validateLocation(k:int, _arg_2:int, _arg_3:int, _arg_4:int, _arg_5:int, _arg_6:int, _arg_7:int, _arg_8:int, _arg_9:Boolean, k0:Number=-1):Boolean;


    }
}//package com.sulake.habbo.room.utils

