package com.sulake.habbo.communication.messages.incoming.competition
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.competition._Str_8358;

    public class _Str_7630 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_7630(k:Function)
        {
            super(k, _Str_8358);
        }

        public function getParser():_Str_8358
        {
            return _parser as _Str_8358;
        }
    }
}
