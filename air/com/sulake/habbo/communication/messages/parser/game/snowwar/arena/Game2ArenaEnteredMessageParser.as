//com.sulake.habbo.communication.messages.parser.game.snowwar.arena.Game2ArenaEnteredMessageParser

package com.sulake.habbo.communication.messages.parser.game.snowwar.arena{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.habbo.communication.messages.parser.game.snowwar.data.Game2PlayerData;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class Game2ArenaEnteredMessageParser implements IMessageParser {

        private var _player:Game2PlayerData;

        public function Game2ArenaEnteredMessageParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;

        public function get player():Game2PlayerData;


    }
}//package com.sulake.habbo.communication.messages.parser.game.snowwar.arena

