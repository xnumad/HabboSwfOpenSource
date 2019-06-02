//com.sulake.habbo.communication.messages.parser.game.directory.Game2UserBlockedMessageParser

package com.sulake.habbo.communication.messages.parser.game.directory{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class Game2UserBlockedMessageParser implements IMessageParser {

        private var _playerBlockLength:int;

        public function Game2UserBlockedMessageParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;

        public function get playerBlockLength():int;


    }
}//package com.sulake.habbo.communication.messages.parser.game.directory

