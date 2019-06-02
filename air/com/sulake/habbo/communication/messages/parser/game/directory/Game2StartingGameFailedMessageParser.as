//com.sulake.habbo.communication.messages.parser.game.directory.Game2StartingGameFailedMessageParser

package com.sulake.habbo.communication.messages.parser.game.directory{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class Game2StartingGameFailedMessageParser implements IMessageParser {

        public static const NOT_ENOUGH_PLAYERS:int;
        public static const GAME_HAS_NO_OWNER:int;

        private var _reason:int;

        public function Game2StartingGameFailedMessageParser();

        public function get reason():int;

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;


    }
}//package com.sulake.habbo.communication.messages.parser.game.directory

