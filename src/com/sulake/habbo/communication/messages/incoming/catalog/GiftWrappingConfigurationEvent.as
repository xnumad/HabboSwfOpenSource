package com.sulake.habbo.communication.messages.incoming.catalog
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.catalog.GiftWrappingConfigurationParser;

    public class GiftWrappingConfigurationEvent extends MessageEvent implements IMessageEvent
    {
        public function GiftWrappingConfigurationEvent(k:Function)
        {
            super(k, GiftWrappingConfigurationParser);
        }

        public function getParser():GiftWrappingConfigurationParser
        {
            return this._parser as GiftWrappingConfigurationParser;
        }
    }
}
