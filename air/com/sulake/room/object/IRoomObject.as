//com.sulake.room.object.IRoomObject

package com.sulake.room.object{
    import com.sulake.room.utils.IVector3d;
    import com.sulake.room.object.visualization.IRoomObjectVisualization;
    import com.sulake.room.object.logic.IRoomObjectMouseHandler;

    public /*dynamic*/ interface IRoomObject {

        function getId():int;
        function getInstanceId():int;
        function getInstanceIdStr():String;
        function getCategory():int;
        function getType():String;
        function isInitialized():Boolean;
        function getLocation():IVector3d;
        function getDirection():IVector3d;
        function getModel():IRoomObjectModel;
        function getVisualization():IRoomObjectVisualization;
        function getMouseHandler():IRoomObjectMouseHandler;
        function getState(k:int):int;
        function getUpdateID():int;
        function tearDown():void;

    }
}//package com.sulake.room.object

