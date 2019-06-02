//com.sulake.habbo.communication.messages.parser.userdefinedroomevents.WiredSaveSuccessParser

package com.sulake.habbo.communication.messages.parser.userdefinedroomevents{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class WiredSaveSuccessParser implements IMessageParser {

        public function WiredSaveSuccessParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;


    }
}//package com.sulake.habbo.communication.messages.parser.userdefinedroomevents

