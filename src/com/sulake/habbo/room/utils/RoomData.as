package com.sulake.habbo.room.utils
{
    public class RoomData 
    {
        private var _roomId:int;
        private var _data:XML;
        private var _floorType:String = null;
        private var _wallType:String = null;
        private var _landscapeType:String = null;

        public function RoomData(k:int, data:XML)
        {
            this._roomId = roomId;
            this._data = data;
        }

        public function get roomId():int
        {
            return this._roomId;
        }

        public function get data():XML
        {
            return this._data;
        }

        public function get _Str_5207():String
        {
            return this._floorType;
        }

        public function set _Str_5207(k:String):void
        {
            this._floorType = k;
        }

        public function get _Str_5259():String
        {
            return this._wallType;
        }

        public function set _Str_5259(k:String):void
        {
            this._wallType = k;
        }

        public function get _Str_5109():String
        {
            return this._landscapeType;
        }

        public function set _Str_5109(k:String):void
        {
            this._landscapeType = k;
        }
    }
}
