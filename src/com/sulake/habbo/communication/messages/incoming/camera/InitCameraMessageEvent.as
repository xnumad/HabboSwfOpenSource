package com.sulake.habbo.communication.messages.incoming.camera
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.camera.InitCameraMessageParser;

    public class InitCameraMessageEvent extends MessageEvent 
    {
        public function InitCameraMessageEvent(k:Function)
        {
            super(k, InitCameraMessageParser);
        }

        public function getParser():InitCameraMessageParser
        {
            return this._parser as InitCameraMessageParser;
        }
    }
}
