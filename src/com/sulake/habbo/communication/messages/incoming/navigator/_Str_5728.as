package com.sulake.habbo.communication.messages.incoming.navigator
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.navigator.UserFlatCatsMessageParser;

    public class _Str_5728 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_5728(k:Function)
        {
            super(k, UserFlatCatsMessageParser);
        }

        public function getParser():UserFlatCatsMessageParser
        {
            return this._parser as UserFlatCatsMessageParser;
        }
    }
}
