package com.sulake.habbo.communication.messages.incoming.newnavigator
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.newnavigator.NavigatorSearchResultBlocksParser;

    public class NavigatorSearchResultBlocksEvent extends MessageEvent
    {
        public function NavigatorSearchResultBlocksEvent(k:Function)
        {
            super(k, NavigatorSearchResultBlocksParser);
        }

        public function getParser():NavigatorSearchResultBlocksParser
        {
            return parser as NavigatorSearchResultBlocksParser;
        }
    }
}
