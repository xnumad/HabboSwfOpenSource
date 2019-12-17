package com.sulake.habbo.communication.messages.incoming.campaign
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.campaign._Str_7028;

    public class _Str_9003 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_9003(k:Function)
        {
            super(k, _Str_7028);
        }

        public function getParser():_Str_7028
        {
            return _parser as _Str_7028;
        }
    }
}
