package com.sulake.room.events
{
    import com.sulake.room.object.IRoomObject;

    public class RoomObjectMouseEvent extends RoomObjectEvent 
    {
        public static const ROE_MOUSE_CLICK:String = "ROE_MOUSE_CLICK";
        public static const ROE_MOUSE_ENTER:String = "ROE_MOUSE_ENTER";
        public static const ROE_MOUSE_MOVE:String = "ROE_MOUSE_MOVE";
        public static const ROE_MOUSE_LEAVE:String = "ROE_MOUSE_LEAVE";
        public static const ROE_MOUSE_DOUBLE_CLICK:String = "ROE_MOUSE_DOUBLE_CLICK";
        public static const ROE_MOUSE_DOWN:String = "ROE_MOUSE_DOWN";

        private var _eventId:String = "";
        private var _altKey:Boolean;
        private var _ctrlKey:Boolean;
        private var _shiftKey:Boolean;
        private var _buttonDown:Boolean;
        private var _localX:int;
        private var _localY:int;
        private var _spriteOffsetX:int;
        private var _spriteOffsetY:int;

        public function RoomObjectMouseEvent(k:String, _arg_2:IRoomObject, _arg_3:String, _arg_4:Boolean=false, _arg_5:Boolean=false, _arg_6:Boolean=false, _arg_7:Boolean=false, _arg_8:Boolean=false, _arg_9:Boolean=false)
        {
            super(k, _arg_2, _arg_8, _arg_9);
            this._eventId = _arg_3;
            this._altKey = _arg_4;
            this._ctrlKey = _arg_5;
            this._shiftKey = _arg_6;
            this._buttonDown = _arg_7;
        }

        public function get eventId():String
        {
            return this._eventId;
        }

        public function get altKey():Boolean
        {
            return this._altKey;
        }

        public function get ctrlKey():Boolean
        {
            return this._ctrlKey;
        }

        public function get shiftKey():Boolean
        {
            return this._shiftKey;
        }

        public function get buttonDown():Boolean
        {
            return this._buttonDown;
        }

        public function get localX():int
        {
            return this._localX;
        }

        public function get localY():int
        {
            return this._localY;
        }

        public function get spriteOffsetX():int
        {
            return this._spriteOffsetX;
        }

        public function get spriteOffsetY():int
        {
            return this._spriteOffsetY;
        }

        public function set localX(k:int):void
        {
            this._localX = k;
        }

        public function set localY(k:int):void
        {
            this._localY = k;
        }

        public function set spriteOffsetX(k:int):void
        {
            this._spriteOffsetX = k;
        }

        public function set spriteOffsetY(k:int):void
        {
            this._spriteOffsetY = k;
        }
    }
}
