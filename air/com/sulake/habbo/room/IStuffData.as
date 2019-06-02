//com.sulake.habbo.room.IStuffData

package com.sulake.habbo.room{
    import com.sulake.core.communication.messages.IMessageDataWrapper;
    import com.sulake.room.object.IRoomObjectModel;
    import com.sulake.room.object.IRoomObjectModelController;

    public /*dynamic*/ interface IStuffData {

        function initializeFromIncomingMessage(k:IMessageDataWrapper):void;
        function initializeFromRoomObjectModel(k:IRoomObjectModel):void;
        function writeRoomObjectModel(k:IRoomObjectModelController):void;
        function getLegacyString():String;
        function getJSONValue(k:String):String;
        function compare(k:IStuffData):Boolean;
        function set flags(k:int):void;
        function get uniqueSerialNumber():int;
        function get uniqueSeriesSize():int;
        function set uniqueSerialNumber(k:int):void;
        function set uniqueSeriesSize(k:int):void;
        function get rarityLevel():int;

    }
}//package com.sulake.habbo.room

