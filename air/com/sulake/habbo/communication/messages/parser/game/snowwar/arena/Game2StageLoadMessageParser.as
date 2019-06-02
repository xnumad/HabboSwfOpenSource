//com.sulake.habbo.communication.messages.parser.game.snowwar.arena.Game2StageLoadMessageParser

package com.sulake.habbo.communication.messages.parser.game.snowwar.arena{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class Game2StageLoadMessageParser implements IMessageParser {

        private var _gameType:int;

        public function Game2StageLoadMessageParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;

        public function get gameType():int;


    }
}//package com.sulake.habbo.communication.messages.parser.game.snowwar.arena

