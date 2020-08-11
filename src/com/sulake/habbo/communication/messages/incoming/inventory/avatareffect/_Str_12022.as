package com.sulake.habbo.communication.messages.incoming.inventory.avatareffect
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.inventory.avatareffect.AvatarEffectSelectedMessageParser;

    public class _Str_12022 extends MessageEvent 
    {
        public function _Str_12022(k:Function)
        {
            super(k, AvatarEffectSelectedMessageParser);
        }

        public function getParser():AvatarEffectSelectedMessageParser
        {
            return _parser as AvatarEffectSelectedMessageParser;
        }
    }
}
