//com.sulake.habbo.communication.messages.parser.facebook.FaceBookErrorMessageParser

package com.sulake.habbo.communication.messages.parser.facebook{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class FaceBookErrorMessageParser implements IMessageParser {

        public function FaceBookErrorMessageParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;


    }
}//package com.sulake.habbo.communication.messages.parser.facebook

