package com.sulake.habbo.communication.messages.incoming.sound
{
    public class PlayListEntry
    {
        protected var _id:int;
        protected var _length:int;
        protected var _name:String;
        protected var _creator:String;
        private var _startPlayHead:Number = 0;

        public function PlayListEntry(id:int, length:int, name:String, creator:String)
        {
            this._id = id;
            this._length = length;
            this._name = name;
            this._creator = creator;
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
            return this._startPlayHead;
        }

        public function set _Str_14463(k:Number):void
        {
            this._startPlayHead = k;
        }
    }
}
