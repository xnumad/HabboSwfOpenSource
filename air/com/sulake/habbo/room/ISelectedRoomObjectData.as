//com.sulake.habbo.room.ISelectedRoomObjectData

package com.sulake.habbo.room{
    public /*dynamic*/ interface ISelectedRoomObjectData {

        function get id():int;
        function get category():int;
        function get operation():String;
        function get typeId():int;
        function get instanceData():String;
        function get stuffData():IStuffData;
        function get state():int;
        function get animFrame():int;
        function get posture():String;

    }
}//package com.sulake.habbo.room

