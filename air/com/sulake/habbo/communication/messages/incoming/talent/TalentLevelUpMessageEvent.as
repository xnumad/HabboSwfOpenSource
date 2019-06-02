//com.sulake.habbo.communication.messages.incoming.talent.TalentLevelUpMessageEvent

package com.sulake.habbo.communication.messages.incoming.talent{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.talent.TalentLevelUpMessageParser;

    [SecureSWF(rename="true")]
    public class TalentLevelUpMessageEvent extends MessageEvent implements IMessageEvent {

        public function TalentLevelUpMessageEvent(k:Function);

        public function getParser():TalentLevelUpMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.talent

