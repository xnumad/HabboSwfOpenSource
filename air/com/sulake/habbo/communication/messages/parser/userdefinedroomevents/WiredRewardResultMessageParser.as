//com.sulake.habbo.communication.messages.parser.userdefinedroomevents.WiredRewardResultMessageParser

package com.sulake.habbo.communication.messages.parser.userdefinedroomevents{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class WiredRewardResultMessageParser implements IMessageParser {

        private var _reason:int;

        public function WiredRewardResultMessageParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;

        public function get reason():int;


    }
}//package com.sulake.habbo.communication.messages.parser.userdefinedroomevents

