package com.sulake.habbo.communication.messages.incoming.landingview
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import _Str_534._Str_8888;

    public class _Str_9504 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_9504(k:Function)
        {
            super(k, _Str_8888);
        }

        public function _Str_2273():_Str_8888
        {
            return _parser as _Str_8888;
        }
    }
}
