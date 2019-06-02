//com.sulake.habbo.communication.messages.incoming.game.lobby.AchievementResolutionProgressMessageEvent

package com.sulake.habbo.communication.messages.incoming.game.lobby{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.game.lobby.AchievementResolutionProgressMessageParser;

    [SecureSWF(rename="true")]
    public class AchievementResolutionProgressMessageEvent extends MessageEvent implements IMessageEvent {

        public function AchievementResolutionProgressMessageEvent(k:Function);

        public function getParser():AchievementResolutionProgressMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.game.lobby

