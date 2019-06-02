//com.sulake.habbo.communication.messages.parser.game.snowwar.arena.Game2EnterArenaFailedMessageParser

package com.sulake.habbo.communication.messages.parser.game.snowwar.arena{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class Game2EnterArenaFailedMessageParser implements IMessageParser {

        public static const GAME_ALREADY_STARTED:int;
        public static const USER_NOT_IN_GAME:int;
        public static const NO_TEAM_FOR_USER:int;
        public static const NO_GAME_STAGE:int;

        private var _reason:int;

        public function Game2EnterArenaFailedMessageParser();

        public function get reason():int;

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;


    }
}//package com.sulake.habbo.communication.messages.parser.game.snowwar.arena

