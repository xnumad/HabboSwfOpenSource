//com.sulake.habbo.communication.messages.parser.game.score.GameRewardWinnerEntry

package com.sulake.habbo.communication.messages.parser.game.score{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class GameRewardWinnerEntry {

        private var _name:String;
        private var _figure:String;
        private var _gender:String;
        private var _rank:int;
        private var _score:int;

        public function GameRewardWinnerEntry(k:IMessageDataWrapper);

        public function get name():String;

        public function get figure():String;

        public function get gender():String;

        public function get rank():int;

        public function get score():int;


    }
}//package com.sulake.habbo.communication.messages.parser.game.score

