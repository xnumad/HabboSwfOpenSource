package com.sulake.habbo.room
{
    import com.sulake.core.communication.messages.IMessageDataWrapper;
    import com.sulake.room.object.IRoomObjectModel;
    import com.sulake.room.object.IRoomObjectModelController;

    public interface IStuffData 
    {
        function initializeFromIncomingMessage(_arg_1:IMessageDataWrapper):void;
        function initializeFromRoomObjectModel(_arg_1:IRoomObjectModel):void;
        function writeRoomObjectModel(_arg_1:IRoomObjectModelController):void;
        function getLegacyString():String;
        function getJSONValue(_arg_1:String):String;
        function compare(_arg_1:IStuffData):Boolean;
        function set flags(_arg_1:int):void;
        function get uniqueSerialNumber():int;
        function get _Str_5330():int;
        function set uniqueSerialNumber(_arg_1:int):void;
        function set _Str_5330(_arg_1:int):void;
        function get rarityLevel():int;
    }
}
