package com.sulake.habbo.communication.messages.incoming._Str_89
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.room.permissions.YouAreControllerMessageParser;

    public class _Str_7845 extends MessageEvent 
    {
        public function _Str_7845(k:Function)
        {
            super(k, YouAreControllerMessageParser);
        }

        public function getParser():YouAreControllerMessageParser
        {
            return _parser as YouAreControllerMessageParser;
        }
    }
}
