package com.sulake.habbo.communication.messages.incoming.newnavigator
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.newnavigator.NavigatorSavedSearchesParser;

    public class _Str_8305 extends MessageEvent 
    {
        public function _Str_8305(k:Function)
        {
            super(k, NavigatorSavedSearchesParser);
        }

        public function getParser():NavigatorSavedSearchesParser
        {
            return parser as NavigatorSavedSearchesParser;
        }
    }
}
