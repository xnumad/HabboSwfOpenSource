//com.sulake.habbo.communication.messages.parser.game.lobby.GameListMessageParser

package com.sulake.habbo.communication.messages.parser.game.lobby{
    import com.sulake.core.communication.messages.IMessageParser;
    import __AS3__.vec.Vector;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class GameListMessageParser implements IMessageParser {

        private var _games:Vector.<GameConfigurationData>;

        public function GameListMessageParser();

        public function flush():Boolean;

        public function get games():Vector.<GameConfigurationData>;

        public function parse(k:IMessageDataWrapper):Boolean;


    }
}//package com.sulake.habbo.communication.messages.parser.game.lobby

