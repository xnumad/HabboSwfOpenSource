package com.sulake.habbo.avatar.actions
{
    public class ActionType 
    {
        private var _id:int;
        private var _value:int;
        private var _prevents:Array;
        private var _preventHeadTurn:Boolean = true;
        private var _isAnimated:Boolean = true;

        public function ActionType(k:XML)
        {
            this._prevents = [];
            super();
            this._id = parseInt(k.@value);
            this._value = parseInt(k.@value);
            var _local_2:String = String(k.@prevents);
            if (_local_2 != "")
            {
                this._prevents = _local_2.split(",");
            }
            this._preventHeadTurn = (String(k.@preventheadturn) == "true");
            var _local_3:String = String(k.@animated);
            if (_local_3 == "")
            {
                this._isAnimated = true;
            }
            else
            {
                this._isAnimated = (_local_3 == "true");
            }
        }

        public function get id():int
        {
            return this._id;
        }

        public function get value():int
        {
            return this._value;
        }

        public function get prevents():Array
        {
            return this._prevents;
        }

        public function get preventHeadTurn():Boolean
        {
            return this._preventHeadTurn;
        }

        public function get isAnimated():Boolean
        {
            return this._isAnimated;
        }
    }
}
