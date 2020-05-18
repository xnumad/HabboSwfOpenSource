package com.sulake.habbo.communication.messages.incoming._Str_447
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser._Str_449.TryPhoneNumberResultParser;

    public class _Str_8427 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_8427(k:Function)
        {
            super(k, TryPhoneNumberResultParser);
        }

        public function getParser():TryPhoneNumberResultParser
        {
            return _parser as TryPhoneNumberResultParser;
        }
    }
}
