//com.sulake.habbo.communication.messages.incoming.game.lobby.AchievementResolutionCompletedMessageEvent

package com.sulake.habbo.communication.messages.incoming.game.lobby{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.game.lobby.AchievementResolutionCompletedMessageParser;

    [SecureSWF(rename="true")]
    public class AchievementResolutionCompletedMessageEvent extends MessageEvent implements IMessageEvent {

        public function AchievementResolutionCompletedMessageEvent(k:Function);

        public function getParser():AchievementResolutionCompletedMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.game.lobby

