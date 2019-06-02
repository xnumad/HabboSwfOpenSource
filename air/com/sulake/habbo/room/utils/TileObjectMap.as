//com.sulake.habbo.room.utils.TileObjectMap

package com.sulake.habbo.room.utils{
    import com.sulake.habbo.room.ITileObjectMap;
    import __AS3__.vec.Vector;
    import com.sulake.room.object.IRoomObject;

    public class TileObjectMap implements ITileObjectMap {

        private var _tileObjectMap:Vector.<Vector.<IRoomObject>>;
        private var _width:int;
        private var _height:int;
        private var _disposed:Boolean;

        public function TileObjectMap(k:int, _arg_2:int);

        public function clear():void;

        public function populate(k:Array):void;

        public function dispose():void;

        public function get disposed():Boolean;

        public function getObjectInTile(k:int, _arg_2:int):IRoomObject;

        public function setObjectInTile(k:int, _arg_2:int, _arg_3:IRoomObject):void;

        public function addRoomObject(k:IRoomObject):void;

        public function toString():String;


    }
}//package com.sulake.habbo.room.utils

