package com.sulake.habbo.communication.messages.incoming.competition
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.competition._Str_9068;

    public class _Str_4748 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_4748(k:Function)
        {
            super(k, _Str_9068);
        }

        public function getParser():_Str_9068
        {
            return _parser as _Str_9068;
        }
    }
}
