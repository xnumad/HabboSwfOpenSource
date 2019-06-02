//com.sulake.habbo.communication.messages.incoming.game.directory.Game2AccountGameStatusMessageEvent

package com.sulake.habbo.communication.messages.incoming.game.directory{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.game.directory.Game2AccountGameStatusMessageParser;

    [SecureSWF(rename="true")]
    public class Game2AccountGameStatusMessageEvent extends MessageEvent implements IMessageEvent {

        public function Game2AccountGameStatusMessageEvent(k:Function);

        public function getParser():Game2AccountGameStatusMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.game.directory

