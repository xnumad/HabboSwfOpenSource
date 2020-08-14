package com.sulake.habbo.communication.messages.incoming.help
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.help._Str_9020;

    public class CallForHelpPendingCallsDeletedMessageEvent extends MessageEvent implements IMessageEvent
    {
        public function CallForHelpPendingCallsDeletedMessageEvent(k:Function)
        {
            super(k, _Str_9020);
        }

        public function getParser():_Str_9020
        {
            return _parser as _Str_9020;
        }
    }
}
