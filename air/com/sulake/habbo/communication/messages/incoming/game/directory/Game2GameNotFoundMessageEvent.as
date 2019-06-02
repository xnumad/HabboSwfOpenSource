//com.sulake.habbo.communication.messages.incoming.game.directory.Game2GameNotFoundMessageEvent

package com.sulake.habbo.communication.messages.incoming.game.directory{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.game.directory.Game2GameNotFoundMessageParser;

    [SecureSWF(rename="true")]
    public class Game2GameNotFoundMessageEvent extends MessageEvent implements IMessageEvent {

        public function Game2GameNotFoundMessageEvent(k:Function);

        public function getParser():Game2GameNotFoundMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.game.directory

