//com.sulake.habbo.room.IFurniStackingHeightMap

package com.sulake.habbo.room{
    public /*dynamic*/ interface IFurniStackingHeightMap {

        function get disposed():Boolean;
        function get width():int;
        function get height():int;
        function dispose():void;
        function getTileHeight(k:int, _arg_2:int):Number;
        function isRoomTile(k:int, _arg_2:int):Boolean;
        function validateLocation(k:int, _arg_2:int, _arg_3:int, _arg_4:int, _arg_5:int, _arg_6:int, _arg_7:int, _arg_8:int, _arg_9:Boolean, k0:Number=-1):Boolean;

    }
}//package com.sulake.habbo.room

