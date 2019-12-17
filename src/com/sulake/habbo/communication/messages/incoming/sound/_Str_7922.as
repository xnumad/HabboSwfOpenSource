package com.sulake.habbo.communication.messages.incoming.sound
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.sound._Str_6477;

    public class _Str_7922 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_7922(k:Function)
        {
            super(k, _Str_6477);
        }

        public function getParser():_Str_6477
        {
            return this._parser as _Str_6477;
        }
    }
}
