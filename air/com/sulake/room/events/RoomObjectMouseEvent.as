//com.sulake.room.events.RoomObjectMouseEvent

package com.sulake.room.events{
    import com.sulake.room.object.IRoomObject;

    public class RoomObjectMouseEvent extends RoomObjectEvent {

        public static const ROOM_OBJECT_MOUSE_CLICK:String;
        public static const ROOM_OBJECT_MOUSE_ENTER:String;
        public static const ROOM_OBJECT_MOUSE_MOVE:String;
        public static const ROOM_OBJECT_MOUSE_LEAVE:String;
        public static const ROOM_OBJECT_MOUSE_DOUBLE_CLICK:String;
        public static const ROOM_OBJECT_MOUSE_DOWN:String;

        private var _eventId:String;
        private var _altKey:Boolean;
        private var _ctrlKey:Boolean;
        private var _shiftKey:Boolean;
        private var _buttonDown:Boolean;
        private var _localX:int;
        private var _localY:int;
        private var _spriteOffsetX:int;
        private var _spriteOffsetY:int;

        public function RoomObjectMouseEvent(k:String, _arg_2:IRoomObject, _arg_3:String, _arg_4:Boolean=false, _arg_5:Boolean=false, _arg_6:Boolean=false, _arg_7:Boolean=false, _arg_8:Boolean=false, _arg_9:Boolean=false);

        public function get eventId():String;

        public function get altKey():Boolean;

        public function get ctrlKey():Boolean;

        public function get shiftKey():Boolean;

        public function get buttonDown():Boolean;

        public function get localX():int;

        public function get localY():int;

        public function get spriteOffsetX():int;

        public function get spriteOffsetY():int;

        public function set localX(k:int):void;

        public function set localY(k:int):void;

        public function set spriteOffsetX(k:int):void;

        public function set spriteOffsetY(k:int):void;


    }
}//package com.sulake.room.events

