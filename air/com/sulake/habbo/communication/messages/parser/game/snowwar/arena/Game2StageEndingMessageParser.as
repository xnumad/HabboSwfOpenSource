//com.sulake.habbo.communication.messages.parser.game.snowwar.arena.Game2StageEndingMessageParser

package com.sulake.habbo.communication.messages.parser.game.snowwar.arena{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class Game2StageEndingMessageParser implements IMessageParser {

        private var _timeToNextState:int;

        public function Game2StageEndingMessageParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;

        public function get timeToNextState():int;


    }
}//package com.sulake.habbo.communication.messages.parser.game.snowwar.arena

