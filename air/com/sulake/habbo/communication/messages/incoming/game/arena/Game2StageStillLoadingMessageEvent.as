//com.sulake.habbo.communication.messages.incoming.game.arena.Game2StageStillLoadingMessageEvent

package com.sulake.habbo.communication.messages.incoming.game.arena{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.game.snowwar.arena.Game2StageStillLoadingMessageParser;

    [SecureSWF(rename="true")]
    public class Game2StageStillLoadingMessageEvent extends MessageEvent implements IMessageEvent {

        public function Game2StageStillLoadingMessageEvent(k:Function);

        public function getParser():Game2StageStillLoadingMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.game.arena

