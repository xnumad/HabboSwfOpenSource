package com.sulake.habbo.communication.messages.incoming.talent
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.talent._Str_7210;

    public class _Str_7229 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_7229(k:Function)
        {
            super(k, _Str_7210);
        }

        public function getParser():_Str_7210
        {
            return _parser as _Str_7210;
        }
    }
}
