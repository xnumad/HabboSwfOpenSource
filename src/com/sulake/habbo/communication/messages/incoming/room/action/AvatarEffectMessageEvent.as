package com.sulake.habbo.communication.messages.incoming.room.action
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.room.action.AvatarEffectMessageParser;

    public class AvatarEffectMessageEvent extends MessageEvent 
    {
        public function AvatarEffectMessageEvent(k:Function)
        {
            super(k, AvatarEffectMessageParser);
        }

        public function getParser():AvatarEffectMessageParser
        {
            return _parser as AvatarEffectMessageParser;
        }
    }
}
