package com.sulake.habbo.communication.messages.incoming.newnavigator
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.newnavigator._Str_9643;

    public class NavigatorSearchResultBlocksEvent extends MessageEvent
    {
        public function NavigatorSearchResultBlocksEvent(k:Function)
        {
            super(k, _Str_9643);
        }

        public function getParser():_Str_9643
        {
            return parser as _Str_9643;
        }
    }
}
