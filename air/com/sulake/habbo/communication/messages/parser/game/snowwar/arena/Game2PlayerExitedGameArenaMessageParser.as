//com.sulake.habbo.communication.messages.parser.game.snowwar.arena.Game2PlayerExitedGameArenaMessageParser

package com.sulake.habbo.communication.messages.parser.game.snowwar.arena{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class Game2PlayerExitedGameArenaMessageParser implements IMessageParser {

        private var _userId:int;
        private var _playerGameObjectId:int;

        public function Game2PlayerExitedGameArenaMessageParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;

        public function get userId():int;

        public function get playerGameObjectId():int;


    }
}//package com.sulake.habbo.communication.messages.parser.game.snowwar.arena

