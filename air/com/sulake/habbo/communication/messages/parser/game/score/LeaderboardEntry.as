//com.sulake.habbo.communication.messages.parser.game.score.LeaderboardEntry

package com.sulake.habbo.communication.messages.parser.game.score{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class LeaderboardEntry {

        private var _userId:int;
        private var _score:int;
        private var _rank:int;
        private var _name:String;
        private var _figure:String;
        private var _gender:String;

        public function LeaderboardEntry(k:IMessageDataWrapper);

        public function get userId():int;

        public function get score():int;

        public function get rank():int;

        public function get figure():String;

        public function get gender():String;

        public function get name():String;


    }
}//package com.sulake.habbo.communication.messages.parser.game.score

