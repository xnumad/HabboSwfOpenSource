package com.sulake.habbo.communication.messages.incoming.competition
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.competition._Str_9570;

    public class _Str_9217 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_9217(k:Function)
        {
            super(k, _Str_9570);
        }

        public function getParser():_Str_9570
        {
            return _parser as _Str_9570;
        }
    }
}
