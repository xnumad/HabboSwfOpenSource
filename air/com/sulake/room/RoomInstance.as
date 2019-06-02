//com.sulake.room.RoomInstance

package com.sulake.room{
    import flash.utils.Dictionary;
    import com.sulake.core.utils.Map;
    import com.sulake.room.renderer.IRoomRendererBase;
    import com.sulake.room.object.IRoomObject;

    public class RoomInstance implements IRoomInstance {

        private var _numberDataList:Dictionary;
        private var _stringDataList:Dictionary;
        private var _numberReadOnlyList:Array;
        private var _stringReadOnlyList:Array;
        private var _managers:Map;
        private var _updateCategories:Array;
        private var _renderer:IRoomRendererBase;
        private var _container:IRoomInstanceContainer;
        private var _id:String;

        public function RoomInstance(k:String, _arg_2:IRoomInstanceContainer);

        public function get id():String;

        public function dispose():void;

        public function getNumber(k:String):Number;

        public function setNumber(k:String, _arg_2:Number, _arg_3:Boolean=false):void;

        public function getString(k:String):String;

        public function setString(k:String, _arg_2:String, _arg_3:Boolean=false):void;

        public function addObjectUpdateCategory(k:int):void;

        public function removeObjectUpdateCategory(k:int):void;

        public function update():void;

        public function createRoomObject(k:int, _arg_2:String, _arg_3:int):IRoomObject;

        public function createObjectInternal(k:int, _arg_2:int, _arg_3:String, _arg_4:int):IRoomObject;

        public function getObject(k:int, _arg_2:int):IRoomObject;

        public function getObjects(k:int):Array;

        public function getObjectWithIndex(k:int, _arg_2:int):IRoomObject;

        public function getObjectCount(k:int):int;

        public function getObjectWithIndexAndType(k:int, _arg_2:String, _arg_3:int):IRoomObject;

        public function getObjectCountForType(k:String, _arg_2:int):int;

        public function disposeObject(k:int, _arg_2:int):Boolean;

        public function disposeObjects(k:int):int;

        public function setRenderer(k:IRoomRendererBase):void;

        public function getRenderer():IRoomRendererBase;

        public function getObjectManagerIds():Array;

        protected function createObjectManager(k:int):IRoomObjectManager;

        protected function getObjectManager(k:int):IRoomObjectManager;

        protected function disposeObjectManager(k:int):Boolean;

        public function hasUninitializedObjects():Boolean;


    }
}//package com.sulake.room

