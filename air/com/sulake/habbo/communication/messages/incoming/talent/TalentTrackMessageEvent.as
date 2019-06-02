//com.sulake.habbo.communication.messages.incoming.talent.TalentTrackMessageEvent

package com.sulake.habbo.communication.messages.incoming.talent{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.talent.TalentTrackMessageParser;

    [SecureSWF(rename="true")]
    public class TalentTrackMessageEvent extends MessageEvent implements IMessageEvent {

        public function TalentTrackMessageEvent(k:Function);

        public function getParser():TalentTrackMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.talent

