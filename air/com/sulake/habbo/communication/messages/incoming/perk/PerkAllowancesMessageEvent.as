//com.sulake.habbo.communication.messages.incoming.perk.PerkAllowancesMessageEvent

package com.sulake.habbo.communication.messages.incoming.perk{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.perk.PerkAllowancesMessageParser;

    [SecureSWF(rename="true")]
    public class PerkAllowancesMessageEvent extends MessageEvent implements IMessageEvent {

        public function PerkAllowancesMessageEvent(k:Function);

        public function getParser():PerkAllowancesMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.perk

