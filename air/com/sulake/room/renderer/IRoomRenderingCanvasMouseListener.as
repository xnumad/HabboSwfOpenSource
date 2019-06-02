//com.sulake.room.renderer.IRoomRenderingCanvasMouseListener

package com.sulake.room.renderer{
    import com.sulake.room.events.RoomSpriteMouseEvent;
    import com.sulake.room.object.IRoomObject;
    import com.sulake.room.utils.IRoomGeometry;

    public /*dynamic*/ interface IRoomRenderingCanvasMouseListener {

        function processRoomCanvasMouseEvent(k:RoomSpriteMouseEvent, _arg_2:IRoomObject, _arg_3:IRoomGeometry):void;

    }
}//package com.sulake.room.renderer

