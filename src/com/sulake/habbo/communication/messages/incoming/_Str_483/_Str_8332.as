package com.sulake.habbo.communication.messages.incoming._Str_483
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import _Str_471._Str_7915;

    public class _Str_8332 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_8332(k:Function)
        {
            super(k, _Str_7915);
        }

        public function _Str_2273():_Str_7915
        {
            return this._parser as _Str_7915;
        }
    }
}
