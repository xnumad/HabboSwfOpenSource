package com.sulake.habbo.communication.messages.incoming.campaign
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.campaign._Str_7637;

    public class _Str_9045 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_9045(k:Function)
        {
            super(k, _Str_7637);
        }

        public function getParser():_Str_7637
        {
            return _parser as _Str_7637;
        }
    }
}
