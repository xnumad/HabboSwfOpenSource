package com.sulake.habbo.communication.messages.incoming.groupforums
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.groupforums.ThreadMessagesMessageParser;

    public class _Str_9446 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_9446(k:Function)
        {
            super(k, ThreadMessagesMessageParser);
        }

        public function getParser():ThreadMessagesMessageParser
        {
            return this._parser as ThreadMessagesMessageParser;
        }
    }
}
