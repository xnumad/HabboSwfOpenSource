//com.sulake.habbo.communication.messages.parser.game.snowwar.arena.Game2StageRunningMessageParser

package com.sulake.habbo.communication.messages.parser.game.snowwar.arena{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class Game2StageRunningMessageParser implements IMessageParser {

        private var _timeToStageEnd:int;

        public function Game2StageRunningMessageParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;

        public function get timeToStageEnd():int;


    }
}//package com.sulake.habbo.communication.messages.parser.game.snowwar.arena

