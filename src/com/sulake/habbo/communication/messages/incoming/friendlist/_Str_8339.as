package com.sulake.habbo.communication.messages.incoming.friendlist
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.friendlist.InstantMessageErrorMessageParser;

    public class _Str_8339 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_8339(k:Function)
        {
            super(k, InstantMessageErrorMessageParser);
        }

        public function getParser():InstantMessageErrorMessageParser
        {
            return this._parser as InstantMessageErrorMessageParser;
        }
    }
}
