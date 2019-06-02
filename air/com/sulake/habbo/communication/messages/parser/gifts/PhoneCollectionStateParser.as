//com.sulake.habbo.communication.messages.parser.gifts.PhoneCollectionStateParser

package com.sulake.habbo.communication.messages.parser.gifts{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class PhoneCollectionStateParser implements IMessageParser {

        private var _phoneStatusCode:int;
        private var _collectionStatusCode:int;
        private var _millisToAllowProcessReset:int;

        public function PhoneCollectionStateParser();

        public function get phoneStatusCode():int;

        public function get collectionStatusCode():int;

        public function get millisToAllowProcessReset():int;

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;


    }
}//package com.sulake.habbo.communication.messages.parser.gifts

