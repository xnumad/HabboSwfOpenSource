//com.sulake.habbo.communication.messages.parser.userdefinedroomevents.WiredValidationErrorParser

package com.sulake.habbo.communication.messages.parser.userdefinedroomevents{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class WiredValidationErrorParser implements IMessageParser {

        private var _info:String;

        public function WiredValidationErrorParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;

        public function get info():String;


    }
}//package com.sulake.habbo.communication.messages.parser.userdefinedroomevents

