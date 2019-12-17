package com.sulake.habbo.communication.messages.incoming.users
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.users._Str_4007;

    public class _Str_3492 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_3492(k:Function)
        {
            super(k, _Str_4007);
        }

        public function getParser():_Str_4007
        {
            return this._parser as _Str_4007;
        }
    }
}
