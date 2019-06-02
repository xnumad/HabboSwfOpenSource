//com.sulake.habbo.session.events.RoomSessionQueueEvent

package com.sulake.habbo.session.events{
    import com.sulake.core.utils.Map;
    import com.sulake.habbo.session.IRoomSession;

    public class RoomSessionQueueEvent extends RoomSessionEvent {

        public static const QUEUE_STATUS:String;
        public static const QUEUE_TYPE_CLUB:String;
        public static const QUEUE_TYPE_NORMAL:String;
        public static const QUEUE_TARGET_VISITOR:int;
        public static const QUEUE_TARGET_SPECTATOR:int;

        private var _name:String;
        private var _target:int;
        private var _queues:Map;
        private var _isActive:Boolean;
        private var _activeQueue:String;

        public function RoomSessionQueueEvent(k:IRoomSession, _arg_2:String, _arg_3:int, _arg_4:Boolean=false, _arg_5:Boolean=false, _arg_6:Boolean=false);

        public function get isActive():Boolean;

        public function get queueSetName():String;

        public function get queueSetTarget():int;

        public function get queueTypes():Array;

        public function getQueueSize(k:String):int;

        public function addQueue(k:String, _arg_2:int):void;


    }
}//package com.sulake.habbo.session.events

