package com.sulake.habbo.communication.messages.incoming._Str_525
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser._Str_521.UserClassificationMessageParser;

    public class _Str_8083 extends MessageEvent 
    {
        public function _Str_8083(k:Function)
        {
            super(k, UserClassificationMessageParser);
        }

        public function getParser():UserClassificationMessageParser
        {
            return _parser as UserClassificationMessageParser;
        }
    }
}
