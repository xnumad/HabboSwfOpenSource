package com.sulake.habbo.communication.messages.incoming.newnavigator
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.newnavigator.NewNavigatorPreferencesParser;

    public class _Str_8763 extends MessageEvent 
    {
        public function _Str_8763(k:Function)
        {
            super(k, NewNavigatorPreferencesParser);
        }

        public function getParser():NewNavigatorPreferencesParser
        {
            return parser as NewNavigatorPreferencesParser;
        }
    }
}
