package com.sulake.habbo.communication.messages.incoming.friendlist
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.friendlist._Str_7185;

    public class _Str_5567 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_5567(k:Function)
        {
            super(k, _Str_7185);
        }

        public function getParser():_Str_7185
        {
            return this._parser as _Str_7185;
        }
    }
}
