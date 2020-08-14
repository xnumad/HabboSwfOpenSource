package com.sulake.habbo.communication.messages.incoming.help
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.help.CallForHelpResultMessageParser;

    public class _Str_7620 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_7620(k:Function)
        {
            super(k, CallForHelpResultMessageParser);
        }

        public function getParser():CallForHelpResultMessageParser
        {
            return _parser as CallForHelpResultMessageParser;
        }
    }
}
