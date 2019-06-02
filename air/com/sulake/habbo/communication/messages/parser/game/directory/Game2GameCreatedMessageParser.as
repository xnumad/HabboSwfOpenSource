//com.sulake.habbo.communication.messages.parser.game.directory.Game2GameCreatedMessageParser

package com.sulake.habbo.communication.messages.parser.game.directory{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.habbo.communication.messages.parser.game.snowwar.data.GameLobbyData;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class Game2GameCreatedMessageParser implements IMessageParser {

        private var _gameLobbyData:GameLobbyData;

        public function Game2GameCreatedMessageParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;

        public function get gameLobbyData():GameLobbyData;


    }
}//package com.sulake.habbo.communication.messages.parser.game.directory

