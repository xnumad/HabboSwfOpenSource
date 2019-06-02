//com.sulake.habbo.communication.messages.incoming.game.directory.Game2StartingGameFailedMessageEvent

package com.sulake.habbo.communication.messages.incoming.game.directory{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.game.directory.Game2StartingGameFailedMessageParser;

    [SecureSWF(rename="true")]
    public class Game2StartingGameFailedMessageEvent extends MessageEvent implements IMessageEvent {

        public function Game2StartingGameFailedMessageEvent(k:Function);

        public function getParser():Game2StartingGameFailedMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.game.directory

