package com.sulake.habbo.communication.messages.incoming.notifications
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.notifications._Str_6671;

    public class _Str_8665 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_8665(k:Function)
        {
            super(k, _Str_6671);
        }

        public function get _Str_3460():String
        {
            return (_parser as _Str_6671)._Str_3460;
        }

        public function getParser():_Str_6671
        {
            return _parser as _Str_6671;
        }
    }
}
