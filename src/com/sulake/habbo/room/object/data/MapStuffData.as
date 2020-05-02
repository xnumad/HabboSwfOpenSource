package com.sulake.habbo.room.object.data
{
    import com.sulake.habbo.room.IStuffData;
    import com.sulake.core.utils.Map;
    import com.sulake.core.communication.messages.IMessageDataWrapper;
    import com.sulake.habbo.room.object.RoomObjectVariableEnum;
    import com.sulake.room.object.IRoomObjectModel;
    import com.sulake.room.object.IRoomObjectModelController;
    import com.sulake.habbo.room.object.*;
    import com.sulake.habbo.room.*;

    public class MapStuffData extends StuffDataBase implements IStuffData 
    {
        public static const FORMAT_KEY:int = StuffDataFormatKeyEnum.MAP_TYPE_KEY;//1
        private static const STATE:String = "state";
        private static const RARITY:String = "rarity";

        private var _data:Map;

        public function MapStuffData(k:Map=null)
        {
            if (k)
            {
                this._data = k;
            }
        }

        override public function initializeFromIncomingMessage(k:IMessageDataWrapper):void
        {
            var key:String;
            var value:String;
            this._data = new Map();
            var amount:int = k.readInteger();
            var iterator:int;
            while (iterator < amount)
            {
                key = k.readString();
                value = k.readString();
                this._data.add(key, value);
                iterator++;
            }
            super.initializeFromIncomingMessage(k);
        }

        override public function initializeFromRoomObjectModel(k:IRoomObjectModel):void
        {
            super.initializeFromRoomObjectModel(k);
            this._data = k.getStringToStringMap(RoomObjectVariableEnum.FURNITURE_DATA);
        }

        override public function writeRoomObjectModel(k:IRoomObjectModelController):void
        {
            super.writeRoomObjectModel(k);
            k.setNumber(RoomObjectVariableEnum.FURNITURE_DATA_FORMAT, FORMAT_KEY);
            k.setStringToStringMap(RoomObjectVariableEnum.FURNITURE_DATA, this._data);
        }

        override public function getLegacyString():String
        {
            if (((this._data) && (!(this._data.getValue(STATE) == null))))
            {
                return this._data[STATE];
            }
            return "";
        }

        public function getValue(k:String):String
        {
            return this._data[k];
        }

        override public function compare(k:IStuffData):Boolean
        {
            return false;
        }

        override public function get rarityLevel():int
        {
            var k:String = this._data[RARITY];
            if (k)
            {
                return int(k);
            }
            return -1;
        }
    }
}
