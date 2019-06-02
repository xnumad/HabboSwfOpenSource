//com.sulake.habbo.communication.messages.incoming.game.directory.Game2StartCounterMessageEvent

package com.sulake.habbo.communication.messages.incoming.game.directory{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.game.directory.Game2StartCounterMessageParser;

    [SecureSWF(rename="true")]
    public class Game2StartCounterMessageEvent extends MessageEvent implements IMessageEvent {

        public function Game2StartCounterMessageEvent(k:Function);

        public function getParser():Game2StartCounterMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.game.directory

