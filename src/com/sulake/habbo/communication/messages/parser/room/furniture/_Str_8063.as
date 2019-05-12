package com.sulake.habbo.communication.messages.parser.room.furniture
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_8063 implements IMessageParser 
    {
        private var _furniId:int;
        private var _videoId:String;
        private var _Str_21563:int;
        private var _Str_20588:int;
        private var _state:int;


        public function flush():Boolean
        {
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._furniId = k.readInteger();
            this._videoId = k.readString();
            this._Str_21563 = k.readInteger();
            this._Str_20588 = k.readInteger();
            this._state = k.readInteger();
            return true;
        }

        public function get furniId():int
        {
            return this._furniId;
        }

        public function get videoId():String
        {
            return this._videoId;
        }

        public function get _Str_25795():int
        {
            return this._Str_21563;
        }

        public function get _Str_23507():int
        {
            return this._Str_20588;
        }

        public function get state():int
        {
            return this._state;
        }
    }
}
