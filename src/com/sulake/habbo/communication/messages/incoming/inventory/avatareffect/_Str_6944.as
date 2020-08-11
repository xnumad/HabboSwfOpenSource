package com.sulake.habbo.communication.messages.incoming.inventory.avatareffect
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.inventory.avatareffect.AvatarEffectAddedMessageParser;

    public class _Str_6944 extends MessageEvent 
    {
        public function _Str_6944(k:Function)
        {
            super(k, AvatarEffectAddedMessageParser);
        }

        public function getParser():AvatarEffectAddedMessageParser
        {
            return _parser as AvatarEffectAddedMessageParser;
        }
    }
}
