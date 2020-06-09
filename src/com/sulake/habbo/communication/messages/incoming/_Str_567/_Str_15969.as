package com.sulake.habbo.communication.messages.incoming._Str_567
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.room.camera.CameraSnapshotMessageParser;

    public class _Str_15969 extends MessageEvent 
    {
        public function _Str_15969(k:Function)
        {
            super(k, CameraSnapshotMessageParser);
        }

        public function getParser():CameraSnapshotMessageParser
        {
            return _parser as CameraSnapshotMessageParser;
        }
    }
}
