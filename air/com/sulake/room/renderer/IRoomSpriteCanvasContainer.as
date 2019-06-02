//com.sulake.room.renderer.IRoomSpriteCanvasContainer

package com.sulake.room.renderer{
    import com.sulake.room.object.IRoomObject;

    public /*dynamic*/ interface IRoomSpriteCanvasContainer {

        function get roomObjectVariableAccurateZ():String;
        function getRoomObject(k:String):IRoomObject;
        function getRoomObjectWithIndex(k:int):IRoomObject;
        function getRoomObjectIdWithIndex(k:int):String;
        function getRoomObjectCount():int;
        function getRoomObjectIdentifier(k:IRoomObject):String;

    }
}//package com.sulake.room.renderer

