package com.sulake.habbo.communication.messages.incoming.camera
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.camera.CameraStorageUrlMessageParser;

    public class _Str_7565 extends MessageEvent 
    {
        public function _Str_7565(k:Function)
        {
            super(k, CameraStorageUrlMessageParser);
        }

        public function getParser():CameraStorageUrlMessageParser
        {
            return this._parser as CameraStorageUrlMessageParser;
        }
    }
}
