package com.sulake.room
{
    import com.sulake.room.object.IRoomObject;
    import com.sulake.room.renderer.IRoomRendererBase;

    public interface IRoomInstance 
    {
        function getNumber(_arg_1:String):Number;
        function setNumber(_arg_1:String, _arg_2:Number, _arg_3:Boolean=false):void;
        function getString(_arg_1:String):String;
        function setString(_arg_1:String, _arg_2:String, _arg_3:Boolean=false):void;
        function dispose():void;
        function update():void;
        function createRoomObject(_arg_1:int, _arg_2:String, _arg_3:int):IRoomObject;
        function getObject(_arg_1:int, _arg_2:int):IRoomObject;
        function getObjects(_arg_1:int):Array;
        function disposeObject(_arg_1:int, _arg_2:int):Boolean;
        function getObjectCount(_arg_1:int):int;
        function getObjectWithIndexAndType(_arg_1:int, _arg_2:String, _arg_3:int):IRoomObject;
        function getObjectCountForType(_arg_1:String, _arg_2:int):int;
        function getObjectWithIndex(_arg_1:int, _arg_2:int):IRoomObject;
        function disposeObjects(_arg_1:int):int;
        function setRenderer(_arg_1:IRoomRendererBase):void;
        function getRenderer():IRoomRendererBase;
    }
}
