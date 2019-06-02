//com.sulake.habbo.communication.messages.parser.navigator.CompetitionRoomsDataMessageParser

package com.sulake.habbo.communication.messages.parser.navigator{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.habbo.communication.messages.incoming.navigator.CompetitionRoomsData;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class CompetitionRoomsDataMessageParser implements IMessageParser {

        private var _data:CompetitionRoomsData;

        public function CompetitionRoomsDataMessageParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;

        public function get data():CompetitionRoomsData;


    }
}//package com.sulake.habbo.communication.messages.parser.navigator

