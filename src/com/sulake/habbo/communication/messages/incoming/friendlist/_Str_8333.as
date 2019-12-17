package com.sulake.habbo.communication.messages.incoming.friendlist
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.friendlist._Str_7159;

    public class _Str_8333 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_8333(k:Function)
        {
            super(k, _Str_7159);
        }

        public function getParser():_Str_7159
        {
            return this._parser as _Str_7159;
        }
    }
}
