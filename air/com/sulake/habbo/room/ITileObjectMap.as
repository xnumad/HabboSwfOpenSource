//com.sulake.habbo.room.ITileObjectMap

package com.sulake.habbo.room{
    import com.sulake.room.object.IRoomObject;

    public /*dynamic*/ interface ITileObjectMap {

        function getObjectInTile(k:int, _arg_2:int):IRoomObject;
        function get disposed():Boolean;

    }
}//package com.sulake.habbo.room

