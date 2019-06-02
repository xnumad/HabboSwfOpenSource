//com.sulake.habbo.communication.messages.parser.game.snowwar.data.Game2GameResult

package com.sulake.habbo.communication.messages.parser.game.snowwar.data{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class Game2GameResult {

        public static const GAME_RESULT_WIN:int;
        public static const GAME_RESULT_LOSE:int;
        public static const GAME_RESULT_TIE:int;

        private var _isDeathMatch:Boolean;
        private var _resultType:int;
        private var _winnerId:int;

        public function Game2GameResult(k:IMessageDataWrapper);

        public function get isDeathMatch():Boolean;

        public function get resultType():int;

        public function get winnerId():int;


    }
}//package com.sulake.habbo.communication.messages.parser.game.snowwar.data

