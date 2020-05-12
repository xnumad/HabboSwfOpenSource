package com.sulake.habbo.communication.messages.incoming.newnavigator
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.newnavigator.NavigatorMetaDataParser;

    public class NavigatorMetaDataEvent extends MessageEvent 
    {
        public function NavigatorMetaDataEvent(k:Function)
        {
            super(k, NavigatorMetaDataParser);
        }

        public function getParser():NavigatorMetaDataParser
        {
            return parser as NavigatorMetaDataParser;
        }
    }
}
