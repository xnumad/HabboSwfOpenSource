package com.sulake.habbo.communication.messages.incoming.sound
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.sound.JukeBoxPlayListAddSongMessageParser;

    public class JukeBoxPlayListAddSongEvent extends MessageEvent implements IMessageEvent 
    {
        public function JukeBoxPlayListAddSongEvent(k:Function)
        {
            super(k, JukeBoxPlayListAddSongMessageParser);
        }

        public function getParser():JukeBoxPlayListAddSongMessageParser
        {
            return this._parser as JukeBoxPlayListAddSongMessageParser;
        }
    }
}
