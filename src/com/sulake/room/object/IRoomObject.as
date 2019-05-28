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
        function isInitialized():Boolean;
        function getLocation():IVector3D;
        function getDirection():IVector3D;
        function getModel():IRoomObjectModel;
        function getVisualization():IRoomObjectVisualization;
        function getMouseHandler():IRoomObjectMouseHandler;
        function getState(_arg_1:int):int;
        function getUpdateID():int;
        function tearDown():void;
    }
}
