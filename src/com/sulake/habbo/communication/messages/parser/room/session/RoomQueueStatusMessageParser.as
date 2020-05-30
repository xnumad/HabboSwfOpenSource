package com.sulake.habbo.communication.messages.parser.room.session
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.utils.Map;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class RoomQueueStatusMessageParser implements IMessageParser
    {
        private var _queueSets:Map;
        private var _activeTarget:int = 0;

        public function RoomQueueStatusMessageParser()
        {
            this._queueSets = new Map();
            super();
        }

        public function get activeTarget():int
        {
            return this._activeTarget;
        }

        public function flush():Boolean
        {
            this._queueSets.reset();
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            var _local_3:int;
            var _local_4:RoomQueueSet;
            var _local_6:String;
            var _local_7:int;
            var _local_8:int;
            this._queueSets.reset();
            var _local_2:int = k.readInteger();
            var _local_5:int;
            while (_local_5 < _local_2)
            {
                _local_6 = k.readString();
                _local_7 = k.readInteger();
                if (_local_5 == 0)
                {
                    this._activeTarget = _local_7;
                }
                _local_4 = new RoomQueueSet(_local_6, _local_7);
                _local_3 = k.readInteger();
                _local_8 = 0;
                while (_local_8 < _local_3)
                {
                    _local_4.addQueue(k.readString(), k.readInteger());
                    _local_8++;
                }
                this._queueSets.add(_local_4.target, _local_4);
                _local_5++;
            }
            return true;
        }

        public function getQueueSetTargets():Array
        {
            return this._queueSets.getKeys();
        }

        public function getQueueSet(k:int):RoomQueueSet
        {
            return this._queueSets.getValue(k) as RoomQueueSet;
        }
    }
}
