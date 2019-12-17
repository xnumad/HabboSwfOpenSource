package com.sulake.habbo.communication.messages.incoming.callforhelp
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.callforhelp._Str_7692;

    public class _Str_7391 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_7391(k:Function)
        {
            super(k, _Str_7692);
        }

        public function getParser():_Str_7692
        {
            return _parser as _Str_7692;
        }
    }
}
