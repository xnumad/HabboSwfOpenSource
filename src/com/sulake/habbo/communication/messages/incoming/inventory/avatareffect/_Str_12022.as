package com.sulake.habbo.communication.messages.incoming.inventory.avatareffect
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.inventory.avatareffect._Str_9648;

    public class _Str_12022 extends MessageEvent 
    {
        public function _Str_12022(k:Function)
        {
            super(k, _Str_9648);
        }

        public function getParser():_Str_9648
        {
            return _parser as _Str_9648;
        }
    }
}
