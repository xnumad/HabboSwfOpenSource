package com.sulake.habbo.communication.messages.incoming._Str_470
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser._Str_505._Str_5515;

    public class _Str_3870 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_3870(k:Function)
        {
            super(k, _Str_5515);
        }

        public function getParser():_Str_5515
        {
            return this._parser as _Str_5515;
        }
    }
}
