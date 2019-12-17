package com.sulake.habbo.communication.messages.incoming.room.action
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.room.action._Str_7571;

    public class RoomUserEffectEvent extends MessageEvent 
    {
        public function RoomUserEffectEvent(k:Function)
        {
            super(k, _Str_7571);
        }

        public function getParser():_Str_7571
        {
            return _parser as _Str_7571;
        }
    }
}
