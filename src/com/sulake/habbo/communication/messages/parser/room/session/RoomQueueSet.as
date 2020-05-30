package com.sulake.habbo.communication.messages.parser.room.session
{
    import com.sulake.core.utils.Map;

    public class RoomQueueSet
    {
        private var _name:String;
        private var _target:int;
        private var _queues:Map;

        public function RoomQueueSet(k:String, _arg_2:int)
        {
            this._name = k;
            this._target = _arg_2;
            this._queues = new Map();
        }

        public function get name():String
        {
            return this._name;
        }

        public function get target():int
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
