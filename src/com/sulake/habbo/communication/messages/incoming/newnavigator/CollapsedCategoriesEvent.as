package com.sulake.habbo.communication.messages.incoming.newnavigator
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.newnavigator.CollapsedCategoriesMessageParser;

    public class CollapsedCategoriesEvent extends MessageEvent 
    {
        public function CollapsedCategoriesEvent(k:Function)
        {
            super(k, CollapsedCategoriesMessageParser);
        }

        public function getParser():CollapsedCategoriesMessageParser
        {
            return parser as CollapsedCategoriesMessageParser;
        }
    }
}
