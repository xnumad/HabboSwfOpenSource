package com.sulake.habbo.communication.messages.incoming.room.furniture
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.room.furniture.OpenPetPackageResultMessageParser;

    public class _Str_8241 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_8241(k:Function)
        {
            super(k, OpenPetPackageResultMessageParser);
        }

        public function getParser():OpenPetPackageResultMessageParser
        {
            return _parser as OpenPetPackageResultMessageParser;
        }
    }
}
