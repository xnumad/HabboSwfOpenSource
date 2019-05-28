package com.sulake.room.renderer
{
    import com.sulake.room.object.IRoomObject;

    public interface IRoomRendererBase 
    {
        function dispose():void;
        function reset():void;
        function feedRoomObject(_arg_1:IRoomObject):void;
        function removeRoomObject(_arg_1:IRoomObject):void;
        function update(_arg_1:uint):void;
    }
}
