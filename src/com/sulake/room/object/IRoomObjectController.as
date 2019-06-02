package com.sulake.room.object
{
    import com.sulake.room.utils.IVector3d;
    import com.sulake.room.object.visualization.IRoomObjectVisualization;
    import com.sulake.room.object.logic.IRoomObjectEventHandler;

    public interface IRoomObjectController extends IRoomObject 
    {
        function dispose():void;
        function setInitialized(_arg_1:Boolean):void;
        function setLocation(_arg_1:IVector3d):void;
        function setDirection(_arg_1:IVector3d):void;
        function setVisualization(_arg_1:IRoomObjectVisualization):void;
        function setState(_arg_1:int, _arg_2:int):Boolean;
        function setEventHandler(_arg_1:IRoomObjectEventHandler):void;
        function getEventHandler():IRoomObjectEventHandler;
        function getModelController():IRoomObjectModelController;
    }
}
