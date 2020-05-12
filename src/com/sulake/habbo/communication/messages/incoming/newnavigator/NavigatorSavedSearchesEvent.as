package com.sulake.habbo.communication.messages.incoming.newnavigator
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.newnavigator.NavigatorSavedSearchesParser;

    public class NavigatorSavedSearchesEvent extends MessageEvent 
    {
        public function NavigatorSavedSearchesEvent(k:Function)
        {
            super(k, NavigatorSavedSearchesParser);
        }

        public function getParser():NavigatorSavedSearchesParser
        {
            return parser as NavigatorSavedSearchesParser;
        }
    }
}
