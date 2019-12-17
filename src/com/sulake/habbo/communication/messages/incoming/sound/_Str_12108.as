package com.sulake.habbo.communication.messages.incoming.sound
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.sound._Str_9329;

    public class _Str_12108 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_12108(k:Function)
        {
            super(k, _Str_9329);
        }

        public function getParser():_Str_9329
        {
            return this._parser as _Str_9329;
        }
    }
}
