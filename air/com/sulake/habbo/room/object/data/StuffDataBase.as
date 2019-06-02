//com.sulake.habbo.room.object.data.StuffDataBase

package com.sulake.habbo.room.object.data{
    import com.sulake.habbo.room.IStuffData;
    import com.sulake.core.communication.messages.IMessageDataWrapper;
    import com.sulake.room.object.IRoomObjectModel;
    import com.sulake.room.object.IRoomObjectModelController;

    public class StuffDataBase implements IStuffData {

        private var _flags:int;
        private var _uniqueSerialNumber:int;
        private var _uniqueSeriesSize:int;

        public function StuffDataBase();

        public function set flags(k:int):void;

        public function initializeFromIncomingMessage(k:IMessageDataWrapper):void;

        public function initializeFromRoomObjectModel(k:IRoomObjectModel):void;

        public function writeRoomObjectModel(k:IRoomObjectModelController):void;

        public function get uniqueSerialNumber():int;

        public function get uniqueSeriesSize():int;

        public function set uniqueSerialNumber(k:int):void;

        public function set uniqueSeriesSize(k:int):void;

        public function getLegacyString():String;

        public function compare(k:IStuffData):Boolean;

        public function get rarityLevel():int;

        public function get state():int;

        public function getJSONValue(k:String):String;


    }
}//package com.sulake.habbo.room.object.data

