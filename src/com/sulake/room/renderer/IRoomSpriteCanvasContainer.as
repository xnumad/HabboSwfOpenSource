package com.sulake.room.renderer
{
    import com.sulake.room.object.IRoomObject;

    public interface IRoomSpriteCanvasContainer 
    {
        function get roomObjectVariableAccurateZ():String;
        function getRoomObject(_arg_1:String):IRoomObject;
        function getRoomObjectWithIndex(_arg_1:int):IRoomObject;
        function getRoomObjectIdWithIndex(_arg_1:int):String;
        function getRoomObjectCount():int;
        function getRoomObjectIdentifier(_arg_1:IRoomObject):String;
    }
}
