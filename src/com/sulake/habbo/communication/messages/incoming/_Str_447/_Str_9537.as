package com.sulake.habbo.communication.messages.incoming._Str_447
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser._Str_449.PhoneCollectionStateParser;

    public class _Str_9537 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_9537(k:Function)
        {
            super(k, PhoneCollectionStateParser);
        }

        public function getParser():PhoneCollectionStateParser
        {
            return _parser as PhoneCollectionStateParser;
        }
    }
}
