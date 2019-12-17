package com.sulake.habbo.communication.messages.incoming.notifications
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.notifications._Str_7117;

    public class _Str_8670 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_8670(k:Function)
        {
            super(k, _Str_7117);
        }

        public function getParser():_Str_7117
        {
            return _parser as _Str_7117;
        }
    }
}
