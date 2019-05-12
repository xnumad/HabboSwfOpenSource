package com.sulake.habbo.communication.messages.parser.game.score
{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_7552 
    {
        private var _name:String;
        private var _figure:String;
        private var _gender:String;
        private var _rank:int;
        private var _score:int;

        public function _Str_7552(k:IMessageDataWrapper)
        {
            this._name = k.readString();
            this._figure = k.readString();
            this._gender = k.readString();
            this._rank = k.readInteger();
            this._score = k.readInteger();
        }

        public function get name():String
        {
            return this._name;
        }

        public function get figure():String
        {
            return this._figure;
        }

        public function get gender():String
        {
            return this._gender;
        }

        public function get rank():int
        {
            return this._rank;
        }

        public function get score():int
        {
            return this._score;
        }
    }
}
