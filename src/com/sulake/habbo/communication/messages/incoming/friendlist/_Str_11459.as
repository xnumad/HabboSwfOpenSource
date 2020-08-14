package com.sulake.habbo.communication.messages.incoming.friendlist
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.friendlist.MiniMailNewMessageMessageParser;

    public class _Str_11459 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_11459(k:Function)
        {
            super(k, MiniMailNewMessageMessageParser);
        }

        public function getParser():MiniMailNewMessageMessageParser
        {
            return _parser as MiniMailNewMessageMessageParser;
        }
    }
}
