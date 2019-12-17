package com.sulake.habbo.communication.messages.incoming.marketplace
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.marketplace._Str_7065;

    public class _Str_9517 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_9517(k:Function)
        {
            super(k, _Str_7065);
        }

        public function getParser():_Str_7065
        {
            return _parser as _Str_7065;
        }
    }
}
