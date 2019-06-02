//com.sulake.habbo.room.object.data.HighScoreData

package com.sulake.habbo.room.object.data{
    public class HighScoreData {

        private var _score:int;
        private var _users:Array;

        public function HighScoreData();

        public function get score():int;

        public function set score(k:int):void;

        public function get users():Array;

        public function set users(k:Array):void;

        public function addUser(k:String):void;


    }
}//package com.sulake.habbo.room.object.data

