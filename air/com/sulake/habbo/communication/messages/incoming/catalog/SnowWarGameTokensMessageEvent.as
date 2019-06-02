//com.sulake.habbo.communication.messages.incoming.catalog.SnowWarGameTokensMessageEvent

package com.sulake.habbo.communication.messages.incoming.catalog{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.catalog.SnowWarGameTokensMessageParser;

    public class SnowWarGameTokensMessageEvent extends MessageEvent implements IMessageEvent {

        public function SnowWarGameTokensMessageEvent(k:Function);

        public function getParser():SnowWarGameTokensMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.catalog

