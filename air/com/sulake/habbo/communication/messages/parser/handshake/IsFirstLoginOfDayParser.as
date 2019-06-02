//com.sulake.habbo.communication.messages.parser.handshake.IsFirstLoginOfDayParser

package com.sulake.habbo.communication.messages.parser.handshake{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class IsFirstLoginOfDayParser implements IMessageParser {

        private var _isFirstLoginOfDay:Boolean;

        public function IsFirstLoginOfDayParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;

        public function get isFirstLoginOfDay():Boolean;


    }
}//package com.sulake.habbo.communication.messages.parser.handshake

