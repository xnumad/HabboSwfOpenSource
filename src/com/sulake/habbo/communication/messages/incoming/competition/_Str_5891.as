package com.sulake.habbo.communication.messages.incoming.competition
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.competition._Str_8659;

    public class _Str_5891 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_5891(k:Function)
        {
            super(k, _Str_8659);
        }

        public function getParser():_Str_8659
        {
            return _parser as _Str_8659;
        }
    }
}
