package com.sulake.habbo.communication.messages.incoming.help
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.help.FaqCategoriesMessageParser;

    public class _Str_18296 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_18296(k:Function)
        {
            super(k, FaqCategoriesMessageParser);
        }

        public function getParser():FaqCategoriesMessageParser
        {
            return _parser as FaqCategoriesMessageParser;
        }
    }
}
