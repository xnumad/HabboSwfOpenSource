//com.sulake.habbo.communication.messages.incoming.room.engine.ObjectMessageData

package com.sulake.habbo.communication.messages.incoming.room.engine{
    import com.sulake.habbo.room.IStuffData;

    public class ObjectMessageData {

        private var _id:int;
        private var _x:Number = 0;
        private var _y:Number = 0;
        private var _z:Number = 0;
        private var _dir:int;
        private var _sizeX:int;
        private var _sizeY:int;
        private var _sizeZ:Number = 0;
        private var _type:int;
        private var _extra:int;
        private var _state:int;
        private var _data:IStuffData;
        private var _expiryTime:int;
        private var _usagePolicy:int;
        private var _ownerId:int;
        private var _ownerName:String;
        private var _staticClass:String;
        private var _isReadOnly:Boolean;

        public function ObjectMessageData(k:int);

        public function setReadOnly():void;

        public function get id():int;

        public function get x():Number;

        public function set x(k:Number):void;

        public function get y():Number;

        public function set y(k:Number):void;

        public function get z():Number;

        public function set z(k:Number):void;

        public function get dir():int;

        public function set dir(k:int):void;

        public function get sizeX():int;

        public function set sizeX(k:int):void;

        public function get sizeY():int;

        public function set sizeY(k:int):void;

        public function get sizeZ():Number;

        public function set sizeZ(k:Number):void;

        public function get type():int;

        public function set type(k:int):void;

        public function get state():int;

        public function set state(k:int):void;

        public function get data():IStuffData;

        public function set data(k:IStuffData):void;

        public function get staticClass():String;

        public function set staticClass(k:String):void;

        public function get extra():int;

        public function set extra(k:int):void;

        public function get expiryTime():int;

        public function set expiryTime(k:int):void;

        public function get usagePolicy():int;

        public function set usagePolicy(k:int):void;

        public function get ownerId():int;

        public function set ownerId(k:int):void;

        public function get ownerName():String;

        public function set ownerName(k:String):void;


    }
}//package com.sulake.habbo.communication.messages.incoming.room.engine

