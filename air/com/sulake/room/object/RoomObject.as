//com.sulake.room.object.RoomObject

package com.sulake.room.object{
    import com.sulake.room.utils.Vector3d;
    import com.sulake.room.object.visualization.IRoomObjectVisualization;
    import com.sulake.room.object.logic.IRoomObjectEventHandler;
    import com.sulake.room.utils.IVector3d;
    import com.sulake.room.object.logic.IRoomObjectMouseHandler;

    public class RoomObject implements IRoomObjectController {

        private static var _globalInstanceId:int;

        private var _id:int;
        private var _category:int;
        private var _type:String;
        private var _loc:Vector3d;
        private var _dir:Vector3d;
        private var _locVisible:Vector3d;
        private var _dirVisible:Vector3d;
        private var _state:int;
        private var _model:RoomObjectModel;
        private var _visualization:IRoomObjectVisualization;
        private var _eventHandler:IRoomObjectEventHandler;
        private var _updateID:int;
        private var _instanceId:int;
        private var _instanceIdStr:String;
        private var _isInitialized:Boolean;

        public function RoomObject(k:int, _arg_2:int, _arg_3:String, _arg_4:int);

        public function dispose():void;

        public function setInitialized(k:Boolean):void;

        public function isInitialized():Boolean;

        public function getId():int;

        public function getInstanceId():int;

        public function getInstanceIdStr():String;

        public function getType():String;

        public function getCategory():int;

        public function getLocation():IVector3d;

        public function getDirection():IVector3d;

        public function getModel():IRoomObjectModel;

        public function getModelController():IRoomObjectModelController;

        public function getState(k:int):int;

        public function getVisualization():IRoomObjectVisualization;

        public function setLocation(k:IVector3d):void;

        public function setDirection(k:IVector3d):void;

        public function setState(k:int, _arg_2:int):Boolean;

        public function setVisualization(k:IRoomObjectVisualization):void;

        public function setEventHandler(k:IRoomObjectEventHandler):void;

        public function getEventHandler():IRoomObjectEventHandler;

        public function getUpdateID():int;

        public function getMouseHandler():IRoomObjectMouseHandler;

        public function tearDown():void;


    }
}//package com.sulake.room.object

