//com.sulake.habbo.communication.messages.incoming.room.furniture.OpenPetPackageResultMessageEvent

package com.sulake.habbo.communication.messages.incoming.room.furniture{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.room.furniture.OpenPetPackageResultMessageParser;

    [SecureSWF(rename="true")]
    public class OpenPetPackageResultMessageEvent extends MessageEvent implements IMessageEvent {

        public function OpenPetPackageResultMessageEvent(k:Function);

        public function getParser():OpenPetPackageResultMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.room.furniture

