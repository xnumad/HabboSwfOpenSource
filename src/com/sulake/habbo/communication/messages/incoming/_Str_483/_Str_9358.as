package com.sulake.habbo.communication.messages.incoming._Str_483
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import _Str_471._Str_7007;

    public class _Str_9358 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_9358(k:Function)
        {
            super(k, _Str_7007);
        }

        public function _Str_2273():_Str_7007
        {
            return this._parser as _Str_7007;
        }
    }
}
