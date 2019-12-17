package com.sulake.habbo.communication.messages.incoming.help
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.help._Str_8306;

    public class _Str_18853 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_18853(k:Function)
        {
            super(k, _Str_8306);
        }

        public function getParser():_Str_8306
        {
            return _parser as _Str_8306;
        }
    }
}
