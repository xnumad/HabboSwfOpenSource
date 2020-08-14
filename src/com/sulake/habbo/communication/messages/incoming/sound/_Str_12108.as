package com.sulake.habbo.communication.messages.incoming.sound
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.sound.JukeboxPlayListFullMessageParser;

    public class _Str_12108 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_12108(k:Function)
        {
            super(k, JukeboxPlayListFullMessageParser);
        }

        public function getParser():JukeboxPlayListFullMessageParser
        {
            return this._parser as JukeboxPlayListFullMessageParser;
        }
    }
}
