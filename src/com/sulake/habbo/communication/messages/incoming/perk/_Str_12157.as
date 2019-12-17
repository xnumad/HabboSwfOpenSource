package com.sulake.habbo.communication.messages.incoming.perk
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.perk._Str_9481;

    public class _Str_12157 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_12157(k:Function)
        {
            super(k, _Str_9481);
        }

        public function getParser():_Str_9481
        {
            return _parser as _Str_9481;
        }
    }
}
