package com.sulake.habbo.communication.messages.incoming.camera
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.camera.CameraPublishStatusMessageParser;

    public class _Str_5617 extends MessageEvent 
    {
        public function _Str_5617(k:Function)
        {
            super(k, CameraPublishStatusMessageParser);
        }

        public function getParser():CameraPublishStatusMessageParser
        {
            return this._parser as CameraPublishStatusMessageParser;
        }
    }
}
