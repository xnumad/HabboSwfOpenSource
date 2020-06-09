package com.sulake.habbo.communication.messages.incoming.room.camera
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.room.camera.CameraSnapshotMessageParser;

    public class CameraSnapshotMessageEvent extends MessageEvent
    {
        public function CameraSnapshotMessageEvent(k:Function)
        {
            super(k, CameraSnapshotMessageParser);
        }

        public function getParser():CameraSnapshotMessageParser
        {
            return _parser as CameraSnapshotMessageParser;
        }
    }
}
