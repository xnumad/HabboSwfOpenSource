package com.sulake.habbo.room.object.data
{
    import com.sulake.habbo.room.IStuffData;
    import __AS3__.vec.Vector;
    import com.sulake.core.communication.messages.IMessageDataWrapper;
    import com.sulake.habbo.room.object.RoomObjectVariableEnum;
    import com.sulake.room.object.IRoomObjectModel;
    import com.sulake.room.object.IRoomObjectModelController;
    import __AS3__.vec.*;

    public class HighScoreStuffData extends StuffDataBase implements IStuffData 
    {
        public static const FORMAT_KEY:int = StuffDataFormatKeyEnum.HIGH_SCORE_TYPE_KEY;

        private var _state:String = "";
        private var _scoreType:int = -1;
        private var _clearType:int = -1;
        private var _entries:Vector.<HighScoreData>;


        public function get scoreType():int
        {
            return this._scoreType;
        }

        public function get clearType():int
        {
            return this._clearType;
        }

        public function get entries():Vector.<HighScoreData>
        {
            return this._entries;
        }

        override public function initializeFromIncomingMessage(k:IMessageDataWrapper):void
        {
            var _local_4:HighScoreData;
            var _local_5:int;
            var _local_6:int;
            this._entries = new Vector.<HighScoreData>();
            this._state = k.readString();
            this._scoreType = k.readInteger();
            this._clearType = k.readInteger();
            var _local_2:int = k.readInteger();
            var _local_3:int;
            while (_local_3 < _local_2)
            {
                _local_4 = new HighScoreData();
                _local_4.score = k.readInteger();
                _local_5 = k.readInteger();
                _local_6 = 0;
                while (_local_6 < _local_5)
                {
                    _local_4.addUser(k.readString());
                    _local_6++;
                }
                this._entries.push(_local_4);
                _local_3++;
            }
        }

        override public function initializeFromRoomObjectModel(k:IRoomObjectModel):void
        {
            var _local_4:HighScoreData;
            this._entries = new Vector.<HighScoreData>();
            super.initializeFromRoomObjectModel(k);
            this._scoreType = k.getNumber(RoomObjectVariableEnum.FURNITURE_HIGHSCORE_SCORE_TYPE);
            this._clearType = k.getNumber(RoomObjectVariableEnum.FURNITURE_HIGHSCORE_CLEAR_TYPE);
            var _local_2:int = k.getNumber(RoomObjectVariableEnum.FURNITURE_HIGHSCORE_DATA_ENTRY_COUNT);
            var _local_3:int;
            while (_local_3 < _local_2)
            {
                _local_4 = new HighScoreData();
                _local_4.score = k.getNumber((RoomObjectVariableEnum.FURNITURE_HIGHSCORE_DATA_ENTRY_BASE_SCORE_ + _local_3));
                _local_4.users = k.getStringArray((RoomObjectVariableEnum.FURNITURE_HIGHSCORE_DATA_ENTRY_BASE_USERS_ + _local_3));
                this._entries.push(_local_4);
                _local_3++;
            }
        }

        override public function writeRoomObjectModel(k:IRoomObjectModelController):void
        {
            var _local_2:int;
            var _local_3:HighScoreData;
            super.writeRoomObjectModel(k);
            k.setNumber(RoomObjectVariableEnum.FURNITURE_DATA_FORMAT, FORMAT_KEY);
            k.setNumber(RoomObjectVariableEnum.FURNITURE_HIGHSCORE_SCORE_TYPE, this._scoreType);
            k.setNumber(RoomObjectVariableEnum.FURNITURE_HIGHSCORE_CLEAR_TYPE, this._clearType);
            if (this._entries)
            {
                k.setNumber(RoomObjectVariableEnum.FURNITURE_HIGHSCORE_DATA_ENTRY_COUNT, this._entries.length);
                _local_2 = 0;
                while (_local_2 < this._entries.length)
                {
                    _local_3 = this._entries[_local_2];
                    k.setNumber((RoomObjectVariableEnum.FURNITURE_HIGHSCORE_DATA_ENTRY_BASE_SCORE_ + _local_2), _local_3.score);
                    k.setStringArray((RoomObjectVariableEnum.FURNITURE_HIGHSCORE_DATA_ENTRY_BASE_USERS_ + _local_2), _local_3.users);
                    _local_2++;
                }
            }
        }

        override public function getLegacyString():String
        {
            return this._state;
        }
    }
}
