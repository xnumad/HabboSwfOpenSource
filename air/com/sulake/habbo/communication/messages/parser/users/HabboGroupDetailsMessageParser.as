//com.sulake.habbo.communication.messages.parser.users.HabboGroupDetailsMessageParser

package com.sulake.habbo.communication.messages.parser.users{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.habbo.communication.messages.incoming.users.HabboGroupDetailsData;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class HabboGroupDetailsMessageParser implements IMessageParser {

        private var _data:HabboGroupDetailsData;

        public function HabboGroupDetailsMessageParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;

        public function get data():HabboGroupDetailsData;


    }
}//package com.sulake.habbo.communication.messages.parser.users

