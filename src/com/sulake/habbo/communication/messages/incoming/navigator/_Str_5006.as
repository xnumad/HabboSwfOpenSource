package com.sulake.habbo.communication.messages.incoming.navigator
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.navigator.CategoriesWithVisitorCountParser;

    public class _Str_5006 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_5006(k:Function)
        {
            super(k, CategoriesWithVisitorCountParser);
        }

        public function getParser():CategoriesWithVisitorCountParser
        {
            return this._parser as CategoriesWithVisitorCountParser;
        }
    }
}
