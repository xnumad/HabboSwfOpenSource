//com.sulake.habbo.communication.messages.parser.game.directory.Game2UserLeftGameMessageParser

package com.sulake.habbo.communication.messages.parser.game.directory{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class Game2UserLeftGameMessageParser implements IMessageParser {

        private var _userId:int;

        public function Game2UserLeftGameMessageParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;

        public function get userId():int;


    }
}//package com.sulake.habbo.communication.messages.parser.game.directory

