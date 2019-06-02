//com.sulake.habbo.communication.messages.incoming.room.camera.CameraSnapshotMessageEvent

package com.sulake.habbo.communication.messages.incoming.room.camera{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.room.camera.CameraSnapshotMessageParser;

    [SecureSWF(rename="true")]
    public class CameraSnapshotMessageEvent extends MessageEvent {

        public function CameraSnapshotMessageEvent(k:Function);

        public function getParser():CameraSnapshotMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.room.camera

