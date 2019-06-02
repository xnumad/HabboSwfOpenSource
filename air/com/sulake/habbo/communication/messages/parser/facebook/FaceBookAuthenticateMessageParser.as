//com.sulake.habbo.communication.messages.parser.facebook.FaceBookAuthenticateMessageParser

package com.sulake.habbo.communication.messages.parser.facebook{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class FaceBookAuthenticateMessageParser implements IMessageParser {

        public function FaceBookAuthenticateMessageParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;


    }
}//package com.sulake.habbo.communication.messages.parser.facebook

