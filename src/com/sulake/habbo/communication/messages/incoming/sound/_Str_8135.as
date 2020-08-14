package com.sulake.habbo.communication.messages.incoming.sound
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.sound.PlayListMessageParser;

    public class _Str_8135 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_8135(k:Function)
        {
            super(k, PlayListMessageParser);
        }

        public function getParser():PlayListMessageParser
        {
            return this._parser as PlayListMessageParser;
        }
    }
}
