package com.sulake.habbo.room.messages
{
    import com.sulake.room.messages.RoomObjectUpdateMessage;
    import flash.display.BitmapData;

    public class RoomObjectRoomAdUpdateMessage extends RoomObjectUpdateMessage 
    {
        public static const RORUM_ROOM_AD_ACTIVATE:String = "RORUM_ROOM_AD_ACTIVATE";
        public static const RORUM_ROOM_BILLBOARD_IMAGE_LOADED:String = "RORUM_ROOM_BILLBOARD_IMAGE_LOADED";
        public static const RORUM_ROOM_BILLBOARD_IMAGE_LOADING_FAILED:String = "RORUM_ROOM_BILLBOARD_IMAGE_LOADING_FAILED";

        private var _type:String;
        private var _asset:String;
        private var _clickUrl:String;
        private var _objectId:int;
        private var _bitmapData:BitmapData;

        public function RoomObjectRoomAdUpdateMessage(k:String, _arg_2:String, _arg_3:String, _arg_4:int=-1, _arg_5:BitmapData=null)
        {
            super(null, null);
            this._type = k;
            this._asset = _arg_2;
            this._clickUrl = _arg_3;
            this._objectId = _arg_4;
            this._bitmapData = _arg_5;
        }

        public function get type():String
        {
            return this._type;
        }

        public function get asset():String
        {
            return this._asset;
        }

        public function get clickUrl():String
        {
            return this._clickUrl;
        }

        public function get _Str_1577():int
        {
            return this._objectId;
        }

        public function get bitmapData():BitmapData
        {
            return this._bitmapData;
        }
    }
}
