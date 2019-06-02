//com.sulake.habbo.communication.messages.parser.users.ExtendedProfileMessageParser

package com.sulake.habbo.communication.messages.parser.users{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.habbo.communication.messages.incoming.users.ExtendedProfileData;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class ExtendedProfileMessageParser implements IMessageParser {

        private var _data:ExtendedProfileData;

        public function ExtendedProfileMessageParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;

        public function get data():ExtendedProfileData;


    }
}//package com.sulake.habbo.communication.messages.parser.users

