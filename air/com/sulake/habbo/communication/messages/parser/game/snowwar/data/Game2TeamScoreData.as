//com.sulake.habbo.communication.messages.parser.game.snowwar.data.Game2TeamScoreData

package com.sulake.habbo.communication.messages.parser.game.snowwar.data{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class Game2TeamScoreData {

        private var _score:int;
        private var _teamReference:int;
        private var _players:Array;

        public function Game2TeamScoreData(k:IMessageDataWrapper);

        public function get score():int;

        public function get teamReference():int;

        public function get players():Array;


    }
}//package com.sulake.habbo.communication.messages.parser.game.snowwar.data

