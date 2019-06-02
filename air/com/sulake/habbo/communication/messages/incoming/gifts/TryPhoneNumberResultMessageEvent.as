//com.sulake.habbo.communication.messages.incoming.gifts.TryPhoneNumberResultMessageEvent

package com.sulake.habbo.communication.messages.incoming.gifts{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.gifts.TryPhoneNumberResultParser;

    [SecureSWF(rename="true")]
    public class TryPhoneNumberResultMessageEvent extends MessageEvent implements IMessageEvent {

        public function TryPhoneNumberResultMessageEvent(k:Function);

        public function getParser():TryPhoneNumberResultParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.gifts

