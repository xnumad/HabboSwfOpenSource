package com.sulake.habbo.communication.messages.incoming.sound
{
    public class SongEntry 
    {
        protected var _id:int;
        protected var _length:int;
        protected var _name:String;
        protected var _creator:String;
        private var _Str_19548:Number = 0;

        public function SongEntry(k:int, _arg_2:int, _arg_3:String, _arg_4:String)
        {
            this._id = k;
            this._length = _arg_2;
            this._name = _arg_3;
            this._creator = _arg_4;
        }

        public function get id():int
        {
            return this._id;
        }

        public function get length():int
        {
            return this._length;
        }

        public function get name():String
        {
            return this._name;
        }

        public function get creator():String
        {
            return this._creator;
        }

        public function get _Str_14463():Number
        {
            return this._Str_19548;
        }

        public function set _Str_14463(k:Number):void
        {
            this._Str_19548 = k;
        }
    }
}
