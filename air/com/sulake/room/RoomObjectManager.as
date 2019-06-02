//com.sulake.room.RoomObjectManager

package com.sulake.room{
    import com.sulake.core.utils.Map;
    import com.sulake.room.object.IRoomObjectController;

    public class RoomObjectManager implements IRoomObjectManager {

        private var _objects:Map;
        private var _objectsPerType:Map;

        public function RoomObjectManager();

        public function dispose():void;

        public function createObject(k:int, _arg_2:uint, _arg_3:String, _arg_4:int):IRoomObjectController;

        private function addObject(k:String, _arg_2:String, _arg_3:IRoomObjectController):IRoomObjectController;

        private function getObjectsForType(k:String, _arg_2:Boolean=true):Map;

        public function getObject(k:int):IRoomObjectController;

        public function getObjects():Array;

        public function getObjectWithIndex(k:int):IRoomObjectController;

        public function getObjectCount():int;

        public function getObjectCountForType(k:String):int;

        public function getObjectWithIndexAndType(k:int, _arg_2:String):IRoomObjectController;

        public function disposeObject(k:int):Boolean;

        public function reset():void;


    }
}//package com.sulake.room

