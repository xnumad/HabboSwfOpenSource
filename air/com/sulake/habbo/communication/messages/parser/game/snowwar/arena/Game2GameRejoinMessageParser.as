//com.sulake.habbo.communication.messages.parser.game.snowwar.arena.Game2GameRejoinMessageParser

package com.sulake.habbo.communication.messages.parser.game.snowwar.arena{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class Game2GameRejoinMessageParser implements IMessageParser {

        private var _roomBeforeGame:int;

        public function Game2GameRejoinMessageParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;

        public function get roomBeforeGame():int;


    }
}//package com.sulake.habbo.communication.messages.parser.game.snowwar.arena

