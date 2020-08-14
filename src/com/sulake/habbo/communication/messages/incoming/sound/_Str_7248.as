package com.sulake.habbo.communication.messages.incoming.sound
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.sound.JukeboxSongDisksMessageParser;

    public class _Str_7248 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_7248(k:Function)
        {
            super(k, JukeboxSongDisksMessageParser);
        }

        public function getParser():JukeboxSongDisksMessageParser
        {
            return this._parser as JukeboxSongDisksMessageParser;
        }
    }
}
