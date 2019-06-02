//com.sulake.habbo.communication.messages.parser.talent.TalentTrackLevelMessageParser

package com.sulake.habbo.communication.messages.parser.talent{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class TalentTrackLevelMessageParser implements IMessageParser {

        private var _talentTrackName:String;
        private var _level:int;
        private var _maxLevel:int;

        public function TalentTrackLevelMessageParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;

        public function get talentTrackName():String;

        public function get level():int;

        public function get maxLevel():int;


    }
}//package com.sulake.habbo.communication.messages.parser.talent

