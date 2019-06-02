//com.sulake.habbo.communication.messages.parser.game.snowwar.arena.Game2EnterArenaMessageParser

package com.sulake.habbo.communication.messages.parser.game.snowwar.arena{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.habbo.communication.messages.parser.game.snowwar.data.GameLevelData;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class Game2EnterArenaMessageParser implements IMessageParser {

        private var _gameType:int;
        private var _fieldType:int;
        private var _numberOfTeams:int;
        private var _players:Array;
        private var _gameLevel:GameLevelData;

        public function Game2EnterArenaMessageParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;

        public function get gameType():int;

        public function get fieldType():int;

        public function get numberOfTeams():int;

        public function get players():Array;

        public function get gameLevel():GameLevelData;


    }
}//package com.sulake.habbo.communication.messages.parser.game.snowwar.arena

