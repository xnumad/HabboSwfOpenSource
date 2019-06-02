//com.sulake.habbo.communication.messages.parser.competition.IsUserPartOfCompetitionMessageParser

package com.sulake.habbo.communication.messages.parser.competition{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class IsUserPartOfCompetitionMessageParser implements IMessageParser {

        private var _isPartOf:Boolean;
        private var _targetId:int;

        public function IsUserPartOfCompetitionMessageParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;

        public function get isPartOf():Boolean;

        public function get targetId():int;


    }
}//package com.sulake.habbo.communication.messages.parser.competition

