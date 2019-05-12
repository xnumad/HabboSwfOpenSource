package com.sulake.room.object
{
    import com.sulake.room.utils.IVector3D;
    import com.sulake.room.object.visualization.IRoomObjectVisualization;
    import com.sulake.room.object.logic.IRoomObjectMouseHandler;

    public interface IRoomObject 
    {
        function getId():int;
        function getInstanceId():int;
        function getType():String;
        function _Str_3022():Boolean;
        function getLocation():IVector3D;
        function getDirection():IVector3D;
        function getModel():IRoomObjectModel;
        function _Str_5222():IRoomObjectVisualization;
        function _Str_11182():IRoomObjectMouseHandler;
        function getState(_arg_1:int):int;
        function _Str_3273():int;
        function tearDown():void;
    }
}
