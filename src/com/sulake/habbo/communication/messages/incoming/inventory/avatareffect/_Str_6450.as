package com.sulake.habbo.communication.messages.incoming.inventory.avatareffect
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.inventory.avatareffect._Str_5747;

    public class _Str_6450 extends MessageEvent 
    {
        public function _Str_6450(k:Function)
        {
            super(k, _Str_5747);
        }

        public function getParser():_Str_5747
        {
            return _parser as _Str_5747;
        }
    }
}
