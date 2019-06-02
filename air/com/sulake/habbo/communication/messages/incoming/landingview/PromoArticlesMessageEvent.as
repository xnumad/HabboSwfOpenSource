//com.sulake.habbo.communication.messages.incoming.landingview.PromoArticlesMessageEvent

package com.sulake.habbo.communication.messages.incoming.landingview{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.landingview.PromoArticlesMessageParser;

    [SecureSWF(rename="true")]
    public class PromoArticlesMessageEvent extends MessageEvent implements IMessageEvent {

        public function PromoArticlesMessageEvent(k:Function);

        public function getParser():PromoArticlesMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.landingview

