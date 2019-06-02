//com.sulake.habbo.communication.messages.parser.game.directory.Game2UserJoinedGameMessageParser

package com.sulake.habbo.communication.messages.parser.game.directory{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.habbo.communication.messages.parser.game.snowwar.data.GameLobbyPlayerData;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class Game2UserJoinedGameMessageParser implements IMessageParser {

        private var _user:GameLobbyPlayerData;
        private var _wasTeamSwitched:Boolean;

        public function Game2UserJoinedGameMessageParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;

        public function get user():GameLobbyPlayerData;

        public function get wasTeamSwitched():Boolean;


    }
}//package com.sulake.habbo.communication.messages.parser.game.directory

