//com.sulake.habbo.communication.messages.parser.game.directory.Game2GameStartedMessageParser

package com.sulake.habbo.communication.messages.parser.game.directory{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.habbo.communication.messages.parser.game.snowwar.data.GameLobbyData;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class Game2GameStartedMessageParser implements IMessageParser {

        private var _lobbyData:GameLobbyData;

        public function Game2GameStartedMessageParser();

        public function get lobbyData():GameLobbyData;

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;


    }
}//package com.sulake.habbo.communication.messages.parser.game.directory

