package com.sulake.habbo.communication.messages.incoming.friendlist
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.friendlist._Str_6189;

    public class _Str_4851 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_4851(k:Function)
        {
            super(k, _Str_6189);
        }

        public function getParser():_Str_6189
        {
            return this._parser as _Str_6189;
        }
    }
}
