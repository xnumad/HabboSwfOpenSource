package com.sulake.habbo.communication.messages.incoming.room.action
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.room.action.AvatarEffectMessageParser;

    public class RoomUserEffectEvent extends MessageEvent 
    {
        public function RoomUserEffectEvent(k:Function)
        {
            super(k, AvatarEffectMessageParser);
        }

        public function getParser():AvatarEffectMessageParser
        {
            return _parser as AvatarEffectMessageParser;
        }
    }
}
