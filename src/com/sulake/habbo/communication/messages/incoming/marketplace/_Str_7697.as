package com.sulake.habbo.communication.messages.incoming.marketplace
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.marketplace._Str_4738;

    public class _Str_7697 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_7697(k:Function)
        {
            super(k, _Str_4738);
        }

        public function getParser():_Str_4738
        {
            return _parser as _Str_4738;
        }
    }
}
