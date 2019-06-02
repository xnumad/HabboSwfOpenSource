//com.sulake.habbo.communication.messages.incoming.room.engine.ItemMessageData

package com.sulake.habbo.communication.messages.incoming.room.engine{
    public class ItemMessageData {

        private var _id:int;
        private var _isOldFormat:Boolean;
        private var _wallX:int;
        private var _wallY:int;
        private var _localX:int;
        private var _localY:int;
        private var _y:Number = 0;
        private var _z:Number = 0;
        private var _dir:String;
        private var _type:int;
        private var _state:int;
        private var _data:String;
        private var _isReadOnly:Boolean;
        private var _usagePolicy:int;
        private var _ownerId:int;
        private var _ownerName:String;
        private var _secondsToExpiration:int;

        public function ItemMessageData(k:int, _arg_2:int, _arg_3:Boolean);

        public function setReadOnly():void;

        public function get id():int;

        public function get isOldFormat():Boolean;

        public function get wallX():Number;

        public function set wallX(k:Number):void;

        public function get wallY():Number;

        public function set wallY(k:Number):void;

        public function get localX():Number;

        public function set localX(k:Number):void;

        public function get localY():Number;

        public function set localY(k:Number):void;

        public function get y():Number;

        public function set y(k:Number):void;

        public function get z():Number;

        public function set z(k:Number):void;

        public function get dir():String;

        public function set dir(k:String):void;

        public function get type():int;

        public function set type(k:int):void;

        public function get state():int;

        public function set state(k:int):void;

        public function get data():String;

        public function set data(k:String):void;

        public function get usagePolicy():int;

        public function set usagePolicy(k:int):void;

        public function get ownerId():int;

        public function set ownerId(k:int):void;

        public function get ownerName():String;

        public function set ownerName(k:String):void;

        public function get secondsToExpiration():int;

        public function set secondsToExpiration(k:int):void;


    }
}//package com.sulake.habbo.communication.messages.incoming.room.engine

