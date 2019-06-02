//com.sulake.habbo.communication.messages.parser.game.directory.Game2StartCounterMessageParser

package com.sulake.habbo.communication.messages.parser.game.directory{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class Game2StartCounterMessageParser implements IMessageParser {

        private var _countDownLength:int;

        public function Game2StartCounterMessageParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;

        public function get countDownLength():int;


    }
}//package com.sulake.habbo.communication.messages.parser.game.directory

