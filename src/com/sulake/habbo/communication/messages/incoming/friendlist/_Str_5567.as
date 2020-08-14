package com.sulake.habbo.communication.messages.incoming.friendlist
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.friendlist.MessengerInitMessageParser;

    public class _Str_5567 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_5567(k:Function)
        {
            super(k, MessengerInitMessageParser);
        }

        public function getParser():MessengerInitMessageParser
        {
            return this._parser as MessengerInitMessageParser;
        }
    }
}
