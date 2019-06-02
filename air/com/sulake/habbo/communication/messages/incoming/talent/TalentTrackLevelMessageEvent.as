//com.sulake.habbo.communication.messages.incoming.talent.TalentTrackLevelMessageEvent

package com.sulake.habbo.communication.messages.incoming.talent{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.talent.TalentTrackLevelMessageParser;

    [SecureSWF(rename="true")]
    public class TalentTrackLevelMessageEvent extends MessageEvent implements IMessageEvent {

        public function TalentTrackLevelMessageEvent(k:Function);

        public function getParser():TalentTrackLevelMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.talent

