//com.sulake.habbo.room.utils.LegacyWallGeometry

package com.sulake.habbo.room.utils{
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.room.utils.IVector3d;

    public class LegacyWallGeometry implements IDisposable {

        private static const DIRECTION_LEFT:String;
        private static const DIRECTION_RIGHT:String;

        private var _isDisposed:Boolean;
        private var _scale:int;
        private var _heightMap:Array;
        private var _width:int;
        private var _height:int;
        private var _floorHeight:int;

        public function LegacyWallGeometry();

        public function get disposed():Boolean;

        public function get scale():int;

        public function set scale(k:int):void;

        public function dispose():void;

        public function initialize(k:int, _arg_2:int, _arg_3:int):void;

        private function reset():void;

        public function setTileHeight(k:int, _arg_2:int, _arg_3:Number):Boolean;

        public function getTileHeight(k:int, _arg_2:int):Number;

        public function getLocation(k:int, _arg_2:int, _arg_3:int, _arg_4:int, _arg_5:String):IVector3d;

        public function getLocationOldFormat(k:Number, _arg_2:Number, _arg_3:String):IVector3d;

        public function getOldLocation(k:IVector3d, _arg_2:Number):Array;

        public function getOldLocationString(k:IVector3d, _arg_2:Number):String;

        public function getDirection(k:String):Number;

        public function getFloorAltitude(k:int, _arg_2:int):Number;

        public function isRoomTile(k:int, _arg_2:int):Boolean;


    }
}//package com.sulake.habbo.room.utils

