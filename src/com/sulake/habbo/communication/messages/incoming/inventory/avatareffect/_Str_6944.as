package com.sulake.habbo.communication.messages.incoming.inventory.avatareffect
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.inventory.avatareffect._Str_7398;

    public class _Str_6944 extends MessageEvent 
    {
        public function _Str_6944(k:Function)
        {
            super(k, _Str_7398);
        }

        public function getParser():_Str_7398
        {
            return _parser as _Str_7398;
        }
    }
}
