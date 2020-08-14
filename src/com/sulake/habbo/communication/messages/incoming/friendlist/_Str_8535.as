package com.sulake.habbo.communication.messages.incoming.friendlist
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.friendlist.MessengerErrorMessageParser;

    public class _Str_8535 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_8535(k:Function)
        {
            super(k, MessengerErrorMessageParser);
        }

        public function getParser():MessengerErrorMessageParser
        {
            return this._parser as MessengerErrorMessageParser;
        }
    }
}
