package com.sulake.habbo.communication.messages.incoming.competition
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.competition._Str_8754;

    public class _Str_8237 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_8237(k:Function)
        {
            super(k, _Str_8754);
        }

        public function getParser():_Str_8754
        {
            return _parser as _Str_8754;
        }
    }
}
