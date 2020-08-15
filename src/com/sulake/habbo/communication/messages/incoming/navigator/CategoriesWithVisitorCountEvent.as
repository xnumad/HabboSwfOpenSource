package com.sulake.habbo.communication.messages.incoming.navigator
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.navigator.CategoriesWithVisitorCountParser;

    public class CategoriesWithVisitorCountEvent extends MessageEvent implements IMessageEvent
    {
        public function CategoriesWithVisitorCountEvent(k:Function)
        {
            super(k, CategoriesWithVisitorCountParser);
        }

        public function getParser():CategoriesWithVisitorCountParser
        {
            return this._parser as CategoriesWithVisitorCountParser;
        }
    }
}
