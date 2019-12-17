package com.sulake.habbo.communication.messages.incoming.callforhelp
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.callforhelp.CfhTopicsInitMessageParser;

    public class _Str_5578 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_5578(k:Function)
        {
            super(k, CfhTopicsInitMessageParser);
        }

        public function getParser():CfhTopicsInitMessageParser
        {
            return _parser as CfhTopicsInitMessageParser;
        }
    }
}
