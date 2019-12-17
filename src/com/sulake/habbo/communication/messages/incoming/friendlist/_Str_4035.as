package com.sulake.habbo.communication.messages.incoming.friendlist
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.friendlist._Str_4925;

    public class _Str_4035 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_4035(k:Function)
        {
            super(k, _Str_4925);
        }

        public function getParser():_Str_4925
        {
            return this._parser as _Str_4925;
        }
    }
}
