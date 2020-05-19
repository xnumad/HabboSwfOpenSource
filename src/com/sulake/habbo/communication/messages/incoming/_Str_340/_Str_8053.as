package com.sulake.habbo.communication.messages.incoming._Str_340
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.camera.ThumbnailStatusMessageParser;

    public class _Str_8053 extends MessageEvent 
    {
        public function _Str_8053(k:Function)
        {
            super(k, ThumbnailStatusMessageParser);
        }

        public function getParser():ThumbnailStatusMessageParser
        {
            return this._parser as ThumbnailStatusMessageParser;
        }
    }
}
