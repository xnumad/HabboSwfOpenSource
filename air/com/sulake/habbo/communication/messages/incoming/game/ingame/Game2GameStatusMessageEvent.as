//com.sulake.habbo.communication.messages.incoming.game.ingame.Game2GameStatusMessageEvent

package com.sulake.habbo.communication.messages.incoming.game.ingame{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.game.snowwar.ingame.Game2GameStatusMessageParser;

    [SecureSWF(rename="true")]
    public class Game2GameStatusMessageEvent extends MessageEvent implements IMessageEvent {

        public function Game2GameStatusMessageEvent(k:Function);

        public function getParser():Game2GameStatusMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.game.ingame

