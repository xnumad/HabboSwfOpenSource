//com.sulake.habbo.communication.messages.incoming.room.furniture.OpenPetPackageRequestedMessageEvent

package com.sulake.habbo.communication.messages.incoming.room.furniture{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.room.furniture.OpenPetPackageRequestedMessageParser;

    [SecureSWF(rename="true")]
    public class OpenPetPackageRequestedMessageEvent extends MessageEvent implements IMessageEvent {

        public function OpenPetPackageRequestedMessageEvent(k:Function);

        public function getParser():OpenPetPackageRequestedMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.room.furniture

