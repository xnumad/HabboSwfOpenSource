//com.sulake.room.IRoomInstanceContainer

package com.sulake.room{
    import com.sulake.room.object.IRoomObject;

    public /*dynamic*/ interface IRoomInstanceContainer {

        function createRoomObject(k:String, _arg_2:int, _arg_3:String, _arg_4:int):IRoomObject;
        function createRoomObjectManager():IRoomObjectManager;

    }
}//package com.sulake.room

