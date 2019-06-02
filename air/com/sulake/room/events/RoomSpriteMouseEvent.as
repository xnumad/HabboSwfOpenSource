//com.sulake.room.events.RoomSpriteMouseEvent

package com.sulake.room.events{
    public class RoomSpriteMouseEvent {

        private var _type:String;
        private var _eventId:String;
        private var _canvasId:String;
        private var _spriteTag:String;
        private var _screenX:Number = 0;
        private var _screenY:Number = 0;
        private var _localX:Number = 0;
        private var _localY:Number = 0;
        private var _ctrlKey:Boolean;
        private var _altKey:Boolean;
        private var _shiftKey:Boolean;
        private var _buttonDown:Boolean;
        private var _spriteOffsetX:int;
        private var _spriteOffsetY:int;

        public function RoomSpriteMouseEvent(k:String, _arg_2:String, _arg_3:String, _arg_4:String, _arg_5:Number, _arg_6:Number, _arg_7:Number=0, _arg_8:Number=0, _arg_9:Boolean=false, k0:Boolean=false, k1:Boolean=false, k2:Boolean=false);

        public function get type():String;

        public function get eventId():String;

        public function get canvasId():String;

        public function get spriteTag():String;

        public function get screenX():Number;

        public function get screenY():Number;

        public function get localX():Number;

        public function get localY():Number;

        public function get ctrlKey():Boolean;

        public function get altKey():Boolean;

        public function get shiftKey():Boolean;

        public function get buttonDown():Boolean;

        public function get spriteOffsetX():int;

        public function set spriteOffsetX(k:int):void;

        public function get spriteOffsetY():int;

        public function set spriteOffsetY(k:int):void;


    }
}//package com.sulake.room.events

