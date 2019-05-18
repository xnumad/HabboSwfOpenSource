package com.sulake.habbo.communication.messages.incoming._Str_447
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import _Str_449._Str_9460;

    public class _Str_9537 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_9537(k:Function)
        {
            super(k, _Str_9460);
        }

        public function _Str_2273():_Str_9460
        {
            return _parser as _Str_9460;
        }
    }
}
