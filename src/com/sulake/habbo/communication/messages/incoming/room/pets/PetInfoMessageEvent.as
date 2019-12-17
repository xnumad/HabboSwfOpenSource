package com.sulake.habbo.communication.messages.incoming.room.pets
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.room.pets._Str_7533;

    public class PetInfoMessageEvent extends MessageEvent implements IMessageEvent 
    {
        public function PetInfoMessageEvent(k:Function)
        {
            super(k, _Str_7533);
        }

        public function getParser():_Str_7533
        {
            return _parser as _Str_7533;
        }
    }
}
