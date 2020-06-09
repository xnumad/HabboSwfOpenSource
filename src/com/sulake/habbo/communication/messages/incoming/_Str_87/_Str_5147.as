package com.sulake.habbo.communication.messages.incoming._Str_87
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.inventory.badges.BadgesParser;

    public class _Str_5147 extends MessageEvent 
    {
        public function _Str_5147(k:Function)
        {
            super(k, BadgesParser);
        }

        public function getParser():BadgesParser
        {
            return _parser as BadgesParser;
        }
    }
}
