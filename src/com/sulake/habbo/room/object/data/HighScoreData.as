package com.sulake.habbo.room.object.data
{
    public class HighScoreData 
    {
        private var _score:int;
        private var _users:Array;

        public function HighScoreData()
        {
            this._users = [];
            super();
            this._score = -1;
        }

        public function get score():int
        {
            return this._score;
        }

        public function set score(k:int):void
        {
            this._score = k;
        }

        public function get users():Array
        {
            return this._users;
        }

        public function set users(k:Array):void
        {
            this._users = k;
        }

        public function addUser(k:String):void
        {
            this._users.push(k);
        }
    }
}
