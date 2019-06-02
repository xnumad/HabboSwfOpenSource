//com.sulake.habbo.communication.messages.incoming.catalog.GiftWrappingConfigurationEvent

package com.sulake.habbo.communication.messages.incoming.catalog{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.catalog.GiftWrappingConfigurationParser;

    [SecureSWF(rename="true")]
    public class GiftWrappingConfigurationEvent extends MessageEvent implements IMessageEvent {

        public function GiftWrappingConfigurationEvent(k:Function);

        public function getParser():GiftWrappingConfigurationParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.catalog

