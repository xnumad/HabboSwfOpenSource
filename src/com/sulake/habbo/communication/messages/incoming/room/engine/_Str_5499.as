package com.sulake.habbo.communication.messages.incoming.room.engine
{
    public class _Str_5499 
    {
        private var _id:int = 0;
        private var _x:Number = 0;
        private var _y:Number = 0;
        private var _z:Number = 0;
        private var _Str_20464:Number = 0;
        private var _Str_20190:Number = 0;
        private var _Str_20813:Number = 0;
        private var _Str_19897:Number = 0;
        private var _dir:int = 0;
        private var _Str_11163:int = 0;
        private var _Str_614:Array;
        private var _Str_19151:Boolean = false;
        private var _Str_11245:Boolean = false;

        public function _Str_5499(k:int, _arg_2:Number, _arg_3:Number, _arg_4:Number, _arg_5:Number, _arg_6:int, _arg_7:int, _arg_8:Number, _arg_9:Number, _arg_10:Number, _arg_11:Boolean, _arg_12:Boolean, _arg_13:Array)
        {
            this._Str_614 = [];
            super();
            this._id = k;
            this._x = _arg_2;
            this._y = _arg_3;
            this._z = _arg_4;
            this._Str_20464 = _arg_5;
            this._dir = _arg_6;
            this._Str_11163 = _arg_7;
            this._Str_20190 = _arg_8;
            this._Str_20813 = _arg_9;
            this._Str_19897 = _arg_10;
            this._Str_19151 = _arg_11;
            this._Str_11245 = _arg_12;
            this._Str_614 = _arg_13;
        }

        public function get id():int
        {
            return this._id;
        }

        public function get x():Number
        {
            return this._x;
        }

        public function get y():Number
        {
            return this._y;
        }

        public function get z():Number
        {
            return this._z;
        }

        public function get _Str_23720():Number
        {
            return this._Str_20464;
        }

        public function get _Str_24054():Number
        {
            return this._Str_20190;
        }

        public function get _Str_24331():Number
        {
            return this._Str_20813;
        }

        public function get _Str_25822():Number
        {
            return this._Str_19897;
        }

        public function get dir():int
        {
            return this._dir;
        }

        public function get dirHead():int
        {
            return this._Str_11163;
        }

        public function get isMoving():Boolean
        {
            return this._Str_19151;
        }

        public function get canStandUp():Boolean
        {
            return this._Str_11245;
        }

        public function get actions():Array
        {
            return this._Str_614.slice();
        }
    }
}
