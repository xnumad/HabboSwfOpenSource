package com.sulake.habbo.communication.messages.incoming.help
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.help.CallForHelpReplyMessageParser;

    public class _Str_7837 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_7837(k:Function)
        {
            super(k, CallForHelpReplyMessageParser);
        }

        public function getParser():CallForHelpReplyMessageParser
        {
            return _parser as CallForHelpReplyMessageParser;
        }
    }
}
