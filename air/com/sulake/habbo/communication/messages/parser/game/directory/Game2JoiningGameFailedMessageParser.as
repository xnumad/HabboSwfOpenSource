//com.sulake.habbo.communication.messages.parser.game.directory.Game2JoiningGameFailedMessageParser

package com.sulake.habbo.communication.messages.parser.game.directory{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class Game2JoiningGameFailedMessageParser implements IMessageParser {

        public static const KICKED:int;
        public static const DUPLICATE_MACHINEID:int;
        public static const INVITATION_REQUIRED:int;
        public static const NO_SPACE_IN_TEAM:int;
        public static const TEAM_NOT_FOUND:int;
        public static const USER_HAS_ACTIVE_INSTANCE:int;
        public static const USER_HAS_PENDING_INSTANCE_REQUEST:int;
        public static const USER_HAS_NO_FREE_GAMES_LEFT:int;

        private var _reason:int;

        public function Game2JoiningGameFailedMessageParser();

        public function get reason():int;

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;


    }
}//package com.sulake.habbo.communication.messages.parser.game.directory

