package com.sulake.habbo.communication.messages.incoming.friendlist
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.friendlist._Str_8755;

    public class _Str_11459 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_11459(k:Function)
        {
            super(k, _Str_8755);
        }

        public function getParser():_Str_8755
        {
            return _parser as _Str_8755;
        }
    }
}
