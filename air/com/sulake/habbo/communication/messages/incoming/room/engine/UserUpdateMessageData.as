//com.sulake.habbo.communication.messages.incoming.room.engine.UserUpdateMessageData

package com.sulake.habbo.communication.messages.incoming.room.engine{
    public class UserUpdateMessageData {

        private var _id:int;
        private var _x:Number = 0;
        private var _y:Number = 0;
        private var _z:Number = 0;
        private var _localZ:Number = 0;
        private var _targetX:Number = 0;
        private var _targetY:Number = 0;
        private var _targetZ:Number = 0;
        private var _dir:int;
        private var _dirHead:int;
        private var _actions:Array;
        private var _isMoving:Boolean;
        private var _canStandUp:Boolean;

        public function UserUpdateMessageData(k:int, _arg_2:Number, _arg_3:Number, _arg_4:Number, _arg_5:Number, _arg_6:int, _arg_7:int, _arg_8:Number, _arg_9:Number, k0:Number, k1:Boolean, k2:Boolean, k3:Array);

        public function get id():int;

        public function get x():Number;

        public function get y():Number;

        public function get z():Number;

        public function get localZ():Number;

        public function get targetX():Number;

        public function get targetY():Number;

        public function get targetZ():Number;

        public function get dir():int;

        public function get dirHead():int;

        public function get isMoving():Boolean;

        public function get canStandUp():Boolean;

        public function get actions():Array;


    }
}//package com.sulake.habbo.communication.messages.incoming.room.engine

