package com.sulake.habbo.communication.messages.incoming.camera
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.camera.CompetitionStatusMessageParser;

    public class _Str_5371 extends MessageEvent 
    {
        public function _Str_5371(k:Function)
        {
            super(k, CompetitionStatusMessageParser);
        }

        public function getParser():CompetitionStatusMessageParser
        {
            return this._parser as CompetitionStatusMessageParser;
        }
    }
}
