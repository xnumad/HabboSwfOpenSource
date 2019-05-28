package com.sulake.room.events
{
    public class RoomSpriteMouseEvent 
    {
        private var _type:String = "";
        private var _eventId:String = "";
        private var _canvasId:String = "";
        private var _spriteTag:String = "";
        private var _screenX:Number = 0;
        private var _screenY:Number = 0;
        private var _localX:Number = 0;
        private var _localY:Number = 0;
        private var _ctrlKey:Boolean = false;
        private var _altKey:Boolean = false;
        private var _shiftKey:Boolean = false;
        private var _buttonDown:Boolean = false;
        private var _spriteOffsetX:int = 0;
        private var _spriteOffsetY:int = 0;

        public function RoomSpriteMouseEvent(k:String, _arg_2:String, _arg_3:String, _arg_4:String, _arg_5:Number, _arg_6:Number, _arg_7:Number=0, _arg_8:Number=0, _arg_9:Boolean=false, _arg_10:Boolean=false, _arg_11:Boolean=false, _arg_12:Boolean=false)
        {
            this._type = k;
            this._eventId = _arg_2;
            this._canvasId = _arg_3;
            this._spriteTag = _arg_4;
            this._screenX = _arg_5;
            this._screenY = _arg_6;
            this._localX = _arg_7;
            this._localY = _arg_8;
            this._ctrlKey = _arg_9;
            this._altKey = _arg_10;
            this._shiftKey = _arg_11;
            this._buttonDown = _arg_12;
        }

        public function get type():String
        {
            return this._type;
        }

        public function get eventId():String
        {
            return this._eventId;
        }

        public function get canvasId():String
        {
            return this._canvasId;
        }

        public function get spriteTag():String
        {
            return this._spriteTag;
        }

        public function get screenX():Number
        {
            return this._screenX;
        }

        public function get screenY():Number
        {
            return this._screenY;
        }

        public function get localX():Number
        {
            return this._localX;
        }

        public function get localY():Number
        {
            return this._localY;
        }

        public function get ctrlKey():Boolean
        {
            return this._ctrlKey;
        }

        public function get altKey():Boolean
        {
            return this._altKey;
        }

        public function get shiftKey():Boolean
        {
            return this._shiftKey;
        }

        public function get buttonDown():Boolean
        {
            return this._buttonDown;
        }

        public function get spriteOffsetX():int
        {
            return this._spriteOffsetX;
        }

        public function set spriteOffsetX(k:int):void
        {
            this._spriteOffsetX = k;
        }

        public function get spriteOffsetY():int
        {
            return this._spriteOffsetY;
        }

        public function set spriteOffsetY(k:int):void
        {
            this._spriteOffsetY = k;
        }
    }
}
