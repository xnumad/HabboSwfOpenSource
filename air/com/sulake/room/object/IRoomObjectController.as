//com.sulake.room.object.IRoomObjectController

package com.sulake.room.object{
    import com.sulake.room.utils.IVector3d;
    import com.sulake.room.object.visualization.IRoomObjectVisualization;
    import com.sulake.room.object.logic.IRoomObjectEventHandler;

    public /*dynamic*/ interface IRoomObjectController extends IRoomObject {

        function dispose():void;
        function setInitialized(k:Boolean):void;
        function setLocation(k:IVector3d):void;
        function setDirection(k:IVector3d):void;
        function setVisualization(k:IRoomObjectVisualization):void;
        function setState(k:int, _arg_2:int):Boolean;
        function setEventHandler(k:IRoomObjectEventHandler):void;
        function getEventHandler():IRoomObjectEventHandler;
        function getModelController():IRoomObjectModelController;

    }
}//package com.sulake.room.object

