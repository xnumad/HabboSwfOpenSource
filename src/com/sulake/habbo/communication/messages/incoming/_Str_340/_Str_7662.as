package com.sulake.habbo.communication.messages.incoming._Str_340
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.camera.InitCameraMessageParser;

    public class _Str_7662 extends MessageEvent 
    {
        public function _Str_7662(k:Function)
        {
            super(k, InitCameraMessageParser);
        }

        public function getParser():InitCameraMessageParser
        {
            return this._parser as InitCameraMessageParser;
        }
    }
}
