package com.sulake.habbo.communication.messages.incoming.room.action
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.room.action.UseObjectMessageParser;

    public class _Str_8069 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_8069(k:Function)
        {
            super(k, UseObjectMessageParser);
        }

        public function getParser():UseObjectMessageParser
        {
            return _parser as UseObjectMessageParser;
        }
    }
}
