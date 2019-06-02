//com.sulake.room.object.logic.IRoomObjectMouseHandler

package com.sulake.room.object.logic{
    import com.sulake.room.events.RoomSpriteMouseEvent;
    import com.sulake.room.utils.IRoomGeometry;
    import flash.geom.Point;

    public /*dynamic*/ interface IRoomObjectMouseHandler {

        function mouseEvent(k:RoomSpriteMouseEvent, _arg_2:IRoomGeometry):void;
        function handleRoomTouchAtLocation(k:Point, _arg_2:IRoomGeometry, _arg_3:String):void;

    }
}//package com.sulake.room.object.logic

