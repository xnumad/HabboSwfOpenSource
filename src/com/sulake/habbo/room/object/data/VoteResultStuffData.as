package com.sulake.habbo.room.object.data
{
    import com.sulake.habbo.room.IStuffData;
    import com.sulake.core.communication.messages.IMessageDataWrapper;
    import com.sulake.habbo.room.object.RoomObjectVariableEnum;
    import com.sulake.core.utils.Map;
    import com.sulake.room.object.IRoomObjectModelController;
    import com.sulake.room.object.IRoomObjectModel;

    public class VoteResultStuffData extends StuffDataBase implements IStuffData 
    {
        public static const FORMAT_KEY:int = StuffDataFormatKeyEnum.VOTE_RESULT_TYPE_KEY;
        private static const S:String = "s";
        private static const R:String = "r";

        private var _state:String = "";
        private var _result:int;


        override public function initializeFromIncomingMessage(k:IMessageDataWrapper):void
        {
            this._state = k.readString();
            this._result = k.readInteger();
            super.initializeFromIncomingMessage(k);
        }

        override public function writeRoomObjectModel(k:IRoomObjectModelController):void
        {
            super.writeRoomObjectModel(k);
            k.setNumber(RoomObjectVariableEnum.FURNITURE_DATA_FORMAT, FORMAT_KEY);
            var data:Map = new Map();
            data.add(S, this._state);
            data.add(R, this._result.toString());
            k.setStringToStringMap(RoomObjectVariableEnum.FURNITURE_DATA, data);
        }

        override public function initializeFromRoomObjectModel(k:IRoomObjectModel):void
        {
            super.initializeFromRoomObjectModel(k);
            var _local_2:Map = k.getStringToStringMap(RoomObjectVariableEnum.FURNITURE_DATA);
            this._state = _local_2.getValue(S);
            this._result = int(_local_2.getValue(R));
        }

        override public function getLegacyString():String
        {
            return this._state;
        }

        public function setString(state:String):void
        {
            this._state = state;
        }

        public function get result():int
        {
            return this._result;
        }

        override public function compare(k:IStuffData):Boolean
        {
            return true;
        }
    }
}
