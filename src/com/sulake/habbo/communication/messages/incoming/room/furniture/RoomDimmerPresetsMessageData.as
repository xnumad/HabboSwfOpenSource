package com.sulake.habbo.communication.messages.incoming.room.furniture
{
    public class RoomDimmerPresetsMessageData
    {
        private var _id:int = 0;
        private var _type:int = 0;
        private var _color:uint = 0;
        private var _Str_3576:uint = 0;
        private var _isReadOnly:Boolean = false;

        public function RoomDimmerPresetsMessageData(k:int)
        {
            this._id = k;
        }

        public function setReadOnly():void
        {
            this._isReadOnly = true;
        }

        public function get id():int
        {
            return this._id;
        }

        public function get type():int
        {
            return this._type;
        }

        public function set type(k:int):void
        {
            if (!this._isReadOnly)
            {
                this._type = k;
            }
        }

        public function get color():uint
        {
            return this._color;
        }

        public function set color(k:uint):void
        {
            if (!this._isReadOnly)
            {
                this._color = k;
            }
        }

        public function get _Str_4272():int
        {
            return this._Str_3576;
        }

        public function set _Str_4272(k:int):void
        {
            if (!this._isReadOnly)
            {
                this._Str_3576 = k;
            }
        }
    }
}
