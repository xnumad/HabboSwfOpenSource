package com.sulake.habbo.session.events
{
    import com.sulake.core.utils.Map;
    import com.sulake.habbo.session.IRoomSession;

    public class RoomSessionQueueEvent extends RoomSessionEvent 
    {
        public static const RSQE_QUEUE_STATUS:String = "RSQE_QUEUE_STATUS";
        public static const C:String = "c";
        public static const D:String = "d";
        public static const QUEUE_TARGET_VISITOR:int = 2;
        public static const QUEUE_TARGET_SPECTATOR:int = 1;

        private var _name:String;
        private var _target:int;
        private var _queues:Map;
        private var _isActive:Boolean;
        private var _activeQueue:String;

        public function RoomSessionQueueEvent(k:IRoomSession, _arg_2:String, _arg_3:int, _arg_4:Boolean=false, _arg_5:Boolean=false, _arg_6:Boolean=false)
        {
            super(RSQE_QUEUE_STATUS, k, _arg_5, _arg_6);
            this._name = _arg_2;
            this._target = _arg_3;
            this._queues = new Map();
            this._isActive = _arg_4;
        }

        public function get isActive():Boolean
        {
            return this._isActive;
        }

        public function get queueSetName():String
        {
            return this._name;
        }

        public function get queueSetTarget():int
        {
            return this._target;
        }

        public function get queueTypes():Array
        {
            return this._queues.getKeys();
        }

        public function getQueueSize(k:String):int
        {
            return this._queues.getValue(k);
        }

        public function addQueue(k:String, _arg_2:int):void
        {
            this._queues.add(k, _arg_2);
        }
    }
}
