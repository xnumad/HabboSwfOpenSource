//com.sulake.habbo.communication.messages.parser.game.snowwar.arena.Game2PlayerRematchesMessageParser

package com.sulake.habbo.communication.messages.parser.game.snowwar.arena{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class Game2PlayerRematchesMessageParser implements IMessageParser {

        private var _userId:int;

        public function Game2PlayerRematchesMessageParser();

        public function get userId():int;

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;


    }
}//package com.sulake.habbo.communication.messages.parser.game.snowwar.arena

