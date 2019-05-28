package com.sulake.room.renderer
{
    import com.sulake.room.events.RoomSpriteMouseEvent;
    import com.sulake.room.object.IRoomObject;
    import com.sulake.room.utils.IRoomGeometry;

    public interface IRoomRenderingCanvasMouseListener 
    {
        function processRoomCanvasMouseEvent(_arg_1:RoomSpriteMouseEvent, _arg_2:IRoomObject, _arg_3:IRoomGeometry):void;
    }
}
