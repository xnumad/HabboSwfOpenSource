package com.sulake.habbo.communication.messages.incoming._Str_87
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.inventory.badges.BadgeReceivedParser;

    public class _Str_8120 extends MessageEvent 
    {
        public function _Str_8120(k:Function)
        {
            super(k, BadgeReceivedParser);
        }

        public function getParser():BadgeReceivedParser
        {
            return _parser as BadgeReceivedParser;
        }
    }
}
