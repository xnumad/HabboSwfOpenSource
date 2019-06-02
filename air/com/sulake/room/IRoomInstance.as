//com.sulake.room.IRoomInstance

package com.sulake.room{
    import com.sulake.room.object.IRoomObject;
    import com.sulake.room.renderer.IRoomRendererBase;

    public /*dynamic*/ interface IRoomInstance {

        function getNumber(k:String):Number;
        function setNumber(k:String, _arg_2:Number, _arg_3:Boolean=false):void;
        function getString(k:String):String;
        function setString(k:String, _arg_2:String, _arg_3:Boolean=false):void;
        function dispose():void;
        function update():void;
        function createRoomObject(k:int, _arg_2:String, _arg_3:int):IRoomObject;
        function getObject(k:int, _arg_2:int):IRoomObject;
        function getObjects(k:int):Array;
        function disposeObject(k:int, _arg_2:int):Boolean;
        function getObjectCount(k:int):int;
        function getObjectWithIndexAndType(k:int, _arg_2:String, _arg_3:int):IRoomObject;
        function getObjectCountForType(k:String, _arg_2:int):int;
        function getObjectWithIndex(k:int, _arg_2:int):IRoomObject;
        function disposeObjects(k:int):int;
        function setRenderer(k:IRoomRendererBase):void;
        function getRenderer():IRoomRendererBase;

    }
}//package com.sulake.room

