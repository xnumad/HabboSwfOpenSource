package com.sulake.habbo.communication.messages.incoming.inventory.clothes
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.inventory.clothing._Str_8728;

    public class _Str_16135 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_16135(k:Function)
        {
            super(k, _Str_8728);
        }

        public function getParser():_Str_8728
        {
            return _parser as _Str_8728;
        }
    }
}
