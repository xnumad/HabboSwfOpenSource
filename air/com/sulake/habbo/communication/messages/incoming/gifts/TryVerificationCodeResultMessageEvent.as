//com.sulake.habbo.communication.messages.incoming.gifts.TryVerificationCodeResultMessageEvent

package com.sulake.habbo.communication.messages.incoming.gifts{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.gifts.TryVerificationCodeResultParser;

    [SecureSWF(rename="true")]
    public class TryVerificationCodeResultMessageEvent extends MessageEvent implements IMessageEvent {

        public function TryVerificationCodeResultMessageEvent(k:Function);

        public function getParser():TryVerificationCodeResultParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.gifts

