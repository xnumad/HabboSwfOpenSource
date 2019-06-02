//com.sulake.habbo.room.object.logic.MovingObjectLogic

package com.sulake.habbo.room.object.logic{
    import com.sulake.room.object.logic.ObjectLogicBase;
    import com.sulake.room.utils.Vector3d;
    import com.sulake.room.object.IRoomObjectController;
    import com.sulake.room.messages.RoomObjectUpdateMessage;
    import com.sulake.room.utils.IVector3d;

    public class MovingObjectLogic extends ObjectLogicBase {

        public static const DEFAULT_UPDATE_INTERVAL:int;
        private static var helper_vector:Vector3d;

        private var _locDelta:Vector3d;
        private var _loc:Vector3d;
        private var _liftAmount:Number = 0;
        private var _lastUpdateTime:int;
        private var _changeTime:int;
        private var _updateInterval:int;

        public function MovingObjectLogic();

        protected function get lastUpdateTime():int;

        override public function dispose():void;

        override public function set object(k:IRoomObjectController):void;

        protected function set moveUpdateInterval(k:int):void;

        override public function processUpdateMessage(k:RoomObjectUpdateMessage):void;

        protected function getLocationOffset():IVector3d;

        override public function update(k:int):void;


    }
}//package com.sulake.habbo.room.object.logic

