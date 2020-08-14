package com.sulake.habbo.communication.messages.incoming.help
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.help.FaqCategoryMessageParser;

    public class _Str_16028 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_16028(k:Function)
        {
            super(k, FaqCategoryMessageParser);
        }

        public function getParser():FaqCategoryMessageParser
        {
            return _parser as FaqCategoryMessageParser;
        }
    }
}
