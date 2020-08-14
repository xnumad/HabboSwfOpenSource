package com.sulake.habbo.communication.messages.incoming.groupforums
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.groupforums.GetForumsListMessageParser;

    public class _Str_9509 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_9509(k:Function)
        {
            super(k, GetForumsListMessageParser);
        }

        public function getParser():GetForumsListMessageParser
        {
            return GetForumsListMessageParser(this._parser);
        }
    }
}
