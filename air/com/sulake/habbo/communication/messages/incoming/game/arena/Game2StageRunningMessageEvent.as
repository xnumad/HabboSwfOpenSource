//com.sulake.habbo.communication.messages.incoming.game.arena.Game2StageRunningMessageEvent

package com.sulake.habbo.communication.messages.incoming.game.arena{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.game.snowwar.arena.Game2StageRunningMessageParser;

    [SecureSWF(rename="true")]
    public class Game2StageRunningMessageEvent extends MessageEvent implements IMessageEvent {

        public function Game2StageRunningMessageEvent(k:Function);

        public function getParser():Game2StageRunningMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.game.arena

