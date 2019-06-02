//com.sulake.habbo.communication.messages.incoming.game.lobby.GameAchievementsMessageEvent

package com.sulake.habbo.communication.messages.incoming.game.lobby{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.game.lobby.GameAchievementsMessageParser;

    [SecureSWF(rename="true")]
    public class GameAchievementsMessageEvent extends MessageEvent implements IMessageEvent {

        public function GameAchievementsMessageEvent(k:Function);

        public function getParser():GameAchievementsMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.game.lobby

