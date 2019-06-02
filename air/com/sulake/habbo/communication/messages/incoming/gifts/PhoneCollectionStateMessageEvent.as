//com.sulake.habbo.communication.messages.incoming.gifts.PhoneCollectionStateMessageEvent

package com.sulake.habbo.communication.messages.incoming.gifts{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.gifts.PhoneCollectionStateParser;

    [SecureSWF(rename="true")]
    public class PhoneCollectionStateMessageEvent extends MessageEvent implements IMessageEvent {

        public function PhoneCollectionStateMessageEvent(k:Function);

        public function getParser():PhoneCollectionStateParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.gifts

