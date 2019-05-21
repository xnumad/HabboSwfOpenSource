package com.sulake.room
{
    import com.sulake.room.object.IRoomObject;

    public interface IRoomInstanceContainer 
    {
        function createRoomObject(_arg_1:String, _arg_2:int, _arg_3:String, _arg_4:int):IRoomObject;
        function createRoomObjectManager():IRoomObjectManager;
    }
}
