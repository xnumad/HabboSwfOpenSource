//com.sulake.habbo.communication.messages.parser.room.session.RoomQueueSet

package com.sulake.habbo.communication.messages.parser.room.session{
    import com.sulake.core.utils.Map;

    public class RoomQueueSet {

        private var _name:String;
        private var _target:int;
        private var _queues:Map;

        public function RoomQueueSet(k:String, _arg_2:int);

        public function get name():String;

        public function get target():int;

        public function get queueTypes():Array;

        public function getQueueSize(k:String):int;

        public function addQueue(k:String, _arg_2:int):void;


    }
}//package com.sulake.habbo.communication.messages.parser.room.session

