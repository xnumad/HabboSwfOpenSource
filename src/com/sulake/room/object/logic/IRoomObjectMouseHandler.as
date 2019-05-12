package com.sulake.room.object.logic
{
    import com.sulake.room.events.RoomSpriteMouseEvent;
    import com.sulake.room.utils.IRoomGeometry;

    public interface IRoomObjectMouseHandler 
    {
        function mouseEvent(_arg_1:RoomSpriteMouseEvent, _arg_2:IRoomGeometry):void;
    }
}
