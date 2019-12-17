package com.sulake.habbo.communication.messages.incoming.help
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.help._Str_6404;

    public class GuideSessionAttachedEvent extends MessageEvent implements IMessageEvent 
    {
        public function GuideSessionAttachedEvent(k:Function)
        {
            super(k, _Str_6404);
        }

        public function getParser():_Str_6404
        {
            return _parser as _Str_6404;
        }
    }
}
