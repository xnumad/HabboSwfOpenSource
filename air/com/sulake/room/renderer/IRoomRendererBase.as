//com.sulake.room.renderer.IRoomRendererBase

package com.sulake.room.renderer{
    import com.sulake.room.object.IRoomObject;

    public /*dynamic*/ interface IRoomRendererBase {

        function dispose():void;
        function reset():void;
        function feedRoomObject(k:IRoomObject):void;
        function removeRoomObject(k:IRoomObject):void;
        function update(k:uint):void;

    }
}//package com.sulake.room.renderer

