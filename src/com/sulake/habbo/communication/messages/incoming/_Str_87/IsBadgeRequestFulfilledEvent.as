package com.sulake.habbo.communication.messages.incoming._Str_87
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.inventory.badges.IsBadgeRequestFulfilledParser;

    public class IsBadgeRequestFulfilledEvent extends MessageEvent
    {
        public function IsBadgeRequestFulfilledEvent(k:Function)
        {
            super(k, IsBadgeRequestFulfilledParser);
        }

        public function getParser():IsBadgeRequestFulfilledParser
        {
            return _parser as IsBadgeRequestFulfilledParser;
        }
    }
}
