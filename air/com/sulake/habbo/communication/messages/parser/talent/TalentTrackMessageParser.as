//com.sulake.habbo.communication.messages.parser.talent.TalentTrackMessageParser

package com.sulake.habbo.communication.messages.parser.talent{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class TalentTrackMessageParser implements IMessageParser {

        private var _talentTrack:TalentTrack;

        public function TalentTrackMessageParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;

        public function getTalentTrack():TalentTrack;


    }
}//package com.sulake.habbo.communication.messages.parser.talent

