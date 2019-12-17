package com.sulake.habbo.communication.messages.incoming.newnavigator
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.newnavigator.NavigatorMetaDataParser;

    public class _Str_8406 extends MessageEvent 
    {
        public function _Str_8406(k:Function)
        {
            super(k, NavigatorMetaDataParser);
        }

        public function getParser():NavigatorMetaDataParser
        {
            return parser as NavigatorMetaDataParser;
        }
    }
}
