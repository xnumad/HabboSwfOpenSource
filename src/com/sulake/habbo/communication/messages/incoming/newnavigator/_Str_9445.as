package com.sulake.habbo.communication.messages.incoming.newnavigator
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.newnavigator.CollapsedCategoriesMessageParser;

    public class _Str_9445 extends MessageEvent 
    {
        public function _Str_9445(k:Function)
        {
            super(k, CollapsedCategoriesMessageParser);
        }

        public function getParser():CollapsedCategoriesMessageParser
        {
            return parser as CollapsedCategoriesMessageParser;
        }
    }
}
