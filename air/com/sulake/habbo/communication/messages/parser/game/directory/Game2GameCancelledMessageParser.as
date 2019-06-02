//com.sulake.habbo.communication.messages.parser.game.directory.Game2GameCancelledMessageParser

package com.sulake.habbo.communication.messages.parser.game.directory{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class Game2GameCancelledMessageParser implements IMessageParser {

        public function Game2GameCancelledMessageParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;


    }
}//package com.sulake.habbo.communication.messages.parser.game.directory

