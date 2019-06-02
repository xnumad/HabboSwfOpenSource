//com.sulake.habbo.communication.messages.incoming.catalog.SellablePetPalettesMessageEvent

package com.sulake.habbo.communication.messages.incoming.catalog{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.catalog.SellablePetPalettesParser;

    [SecureSWF(rename="true")]
    public class SellablePetPalettesMessageEvent extends MessageEvent implements IMessageEvent {

        public function SellablePetPalettesMessageEvent(k:Function);

        public function getParser():SellablePetPalettesParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.catalog

