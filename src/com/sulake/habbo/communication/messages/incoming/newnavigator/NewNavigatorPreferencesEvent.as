package com.sulake.habbo.communication.messages.incoming.newnavigator
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.newnavigator.NewNavigatorPreferencesParser;

    public class NewNavigatorPreferencesEvent extends MessageEvent
    {
        public function NewNavigatorPreferencesEvent(k:Function)
        {
            super(k, NewNavigatorPreferencesParser);
        }

        public function getParser():NewNavigatorPreferencesParser
        {
            return parser as NewNavigatorPreferencesParser;
        }
    }
}
