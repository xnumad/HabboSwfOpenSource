package com.sulake.habbo.communication.messages.incoming.callforhelp
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.callforhelp._Str_7060;

    public class _Str_9038 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_9038(k:Function)
        {
            super(k, _Str_7060);
        }

        public function getParser():_Str_7060
        {
            return _parser as _Str_7060;
        }
    }
}
