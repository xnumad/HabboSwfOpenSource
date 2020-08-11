package com.sulake.habbo.communication.messages.incoming.callforhelp
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.callforhelp.CfhSanctionMessageParser;

    public class _Str_9038 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_9038(k:Function)
        {
            super(k, CfhSanctionMessageParser);
        }

        public function getParser():CfhSanctionMessageParser
        {
            return _parser as CfhSanctionMessageParser;
        }
    }
}
