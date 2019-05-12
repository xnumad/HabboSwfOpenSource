package com.sulake.habbo.communication.messages.parser.game.score
{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_3326 
    {
        private var _userId:int;
        private var _score:int;
        private var _rank:int;
        private var _name:String;
        private var _figure:String;
        private var _gender:String;

        public function _Str_3326(k:IMessageDataWrapper)
        {
            this._userId = k.readInteger();
            this._score = k.readInteger();
            this._rank = k.readInteger();
            this._name = k.readString();
            this._figure = k.readString();
            this._gender = k.readString();
        }

        public function get userId():int
        {
            return this._userId;
        }

        public function get score():int
        {
            return this._score;
        }

        public function get rank():int
        {
            return this._rank;
        }

        public function get figure():String
        {
            return this._figure;
        }

        public function get gender():String
        {
            return this._gender;
        }

        public function get name():String
        {
            return this._name;
        }
    }
}
