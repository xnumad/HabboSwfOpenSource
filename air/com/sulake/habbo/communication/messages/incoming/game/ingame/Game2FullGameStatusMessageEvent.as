//com.sulake.habbo.communication.messages.incoming.game.ingame.Game2FullGameStatusMessageEvent

package com.sulake.habbo.communication.messages.incoming.game.ingame{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.game.snowwar.ingame.Game2FullGameStatusMessageParser;

    [SecureSWF(rename="true")]
    public class Game2FullGameStatusMessageEvent extends MessageEvent implements IMessageEvent {

        public function Game2FullGameStatusMessageEvent(k:Function);

        public function getParser():Game2FullGameStatusMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.game.ingame

