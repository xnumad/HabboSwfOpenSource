//com.sulake.habbo.communication.messages.incoming.game.arena.Game2StageLoadMessageEvent

package com.sulake.habbo.communication.messages.incoming.game.arena{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.game.snowwar.arena.Game2StageLoadMessageParser;

    [SecureSWF(rename="true")]
    public class Game2StageLoadMessageEvent extends MessageEvent implements IMessageEvent {

        public function Game2StageLoadMessageEvent(k:Function);

        public function getParser():Game2StageLoadMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.game.arena

