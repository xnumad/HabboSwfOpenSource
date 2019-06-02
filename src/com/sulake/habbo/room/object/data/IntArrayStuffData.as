package com.sulake.habbo.room.object.data
{
    import com.sulake.habbo.room.IStuffData;
    import com.sulake.core.communication.messages.IMessageDataWrapper;
    import com.sulake.habbo.room.object.RoomObjectVariableEnum;
    import com.sulake.room.object.IRoomObjectModel;
    import com.sulake.room.object.IRoomObjectModelController;

    public class IntArrayStuffData extends StuffDataBase implements IStuffData 
    {
        public static const FORMAT_KEY:int = StuffDataFormatKeyEnum.INT_ARRAY_TYPE_KEY;
        private static const STATE_DEFAULT_INDEX:int = 0;

        private var _data:Array;

        public function IntArrayStuffData()
        {
            this._data = [];
            super();
        }

        override public function initializeFromIncomingMessage(k:IMessageDataWrapper):void
        {
            var _local_4:int;
            this._data = new Array();
            var _local_2:int = k.readInteger();
            var _local_3:int;
            while (_local_3 < _local_2)
            {
                _local_4 = k.readInteger();
                this._data.push(_local_4);
                _local_3++;
            }
            super.initializeFromIncomingMessage(k);
        }

        override public function initializeFromRoomObjectModel(k:IRoomObjectModel):void
        {
            super.initializeFromRoomObjectModel(k);
            this._data = k.getNumberArray(RoomObjectVariableEnum.FURNITURE_DATA);
        }

        override public function writeRoomObjectModel(k:IRoomObjectModelController):void
        {
            super.writeRoomObjectModel(k);
            k.setNumber(RoomObjectVariableEnum.FURNITURE_DATA_FORMAT, FORMAT_KEY);
            k.setNumberArray(RoomObjectVariableEnum.FURNITURE_DATA, this._data);
        }

        override public function getLegacyString():String
        {
            if (!this._data)
            {
                return "";
            }
            return this._data[STATE_DEFAULT_INDEX];
        }

        public function getValue(k:int):int
        {
            if (((this._data) && (k < this._data.length)))
            {
                return this._data[k];
            }
            return -1;
        }

        public function _Str_13438(k:Array):void
        {
            this._data = k;
        }

        override public function compare(k:IStuffData):Boolean
        {
            var _local_2:IntArrayStuffData = (k as IntArrayStuffData);
            if (!_local_2)
            {
                return false;
            }
            var _local_3:int;
            while (_local_3 < this._data.length)
            {
                if (_local_3 == STATE_DEFAULT_INDEX)
                {
                }
                else
                {
                    if (this._data[_local_3] != _local_2.getValue(_local_3))
                    {
                        return false;
                    }
                }
                _local_3++;
            }
            return true;
        }
    }
}
