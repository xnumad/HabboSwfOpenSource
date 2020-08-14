package com.sulake.habbo.communication.messages.incoming.groupforums
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.groupforums.UnreadForumsCountMessageParser;

    public class _Str_8905 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_8905(k:Function)
        {
            super(k, UnreadForumsCountMessageParser);
        }

        public function getParser():UnreadForumsCountMessageParser
        {
            return this._parser as UnreadForumsCountMessageParser;
        }
    }
}
