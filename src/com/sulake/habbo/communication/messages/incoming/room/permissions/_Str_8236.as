package com.sulake.habbo.communication.messages.incoming.room.permissions
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.room.permissions.YouAreNotControllerMessageParser;

    public class _Str_8236 extends MessageEvent 
    {
        public function _Str_8236(k:Function)
        {
            super(k, YouAreNotControllerMessageParser);
        }

        public function getParser():YouAreNotControllerMessageParser
        {
            return _parser as YouAreNotControllerMessageParser;
        }
    }
}
