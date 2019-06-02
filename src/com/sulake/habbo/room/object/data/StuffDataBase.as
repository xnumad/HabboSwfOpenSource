package com.sulake.habbo.room.object.data
{
    import com.sulake.habbo.room.IStuffData;
    import com.sulake.core.communication.messages.IMessageDataWrapper;
    import com.sulake.habbo.room.object.RoomObjectVariableEnum;
    import com.sulake.room.object.IRoomObjectModel;
    import com.sulake.room.object.IRoomObjectModelController;
    import adobe.serialization.json.JSONDecoder;

    public class StuffDataBase implements IStuffData 
    {
        private var _flags:int;
        private var _uniqueSerialNumber:int = 0;
        private var _uniqueSeriesSize:int = 0;


        public function set flags(k:int):void
        {
            this._flags = k;
        }

        public function initializeFromIncomingMessage(k:IMessageDataWrapper):void
        {
            if ((this._flags & StuffDataFlagsEnum._Str_17042) > 0)
            {
                this._uniqueSerialNumber = k.readInteger();
                this._uniqueSeriesSize = k.readInteger();
            }
        }

        public function initializeFromRoomObjectModel(k:IRoomObjectModel):void
        {
            this._uniqueSerialNumber = k.getNumber(RoomObjectVariableEnum.FURNITURE_UNIQUE_SERIAL_NUMBER);
            this._uniqueSeriesSize = k.getNumber(RoomObjectVariableEnum.FURNITURE_UNIQUE_EDITION_SIZE);
        }

        public function writeRoomObjectModel(k:IRoomObjectModelController):void
        {
            k.setNumber(RoomObjectVariableEnum.FURNITURE_UNIQUE_SERIAL_NUMBER, this._uniqueSerialNumber);
            k.setNumber(RoomObjectVariableEnum.FURNITURE_UNIQUE_EDITION_SIZE, this._uniqueSeriesSize);
        }

        public function get uniqueSerialNumber():int
        {
            return this._uniqueSerialNumber;
        }

        public function get _Str_5330():int
        {
            return this._uniqueSeriesSize;
        }

        public function set uniqueSerialNumber(k:int):void
        {
            this._uniqueSerialNumber = k;
        }

        public function set _Str_5330(k:int):void
        {
            this._uniqueSeriesSize = k;
        }

        public function getLegacyString():String
        {
            return "";
        }

        public function compare(k:IStuffData):Boolean
        {
            return false;
        }

        public function get rarityLevel():int
        {
            return -1;
        }

        public function get state():int
        {
            var k:Number = Number(this.getLegacyString());
            return (isNaN(k)) ? -1 : int(k);
        }

        public function getJSONValue(key:String):String
        {
            var value:String;
            try
            {
                value = new JSONDecoder(this.getLegacyString(), true).getValue()[key];
                return value;
            }
            catch(error:Error)
            {
                return "";
            }
            return "";
        }
    }
}
