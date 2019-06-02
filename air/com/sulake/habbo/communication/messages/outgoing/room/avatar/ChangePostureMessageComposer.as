//com.sulake.habbo.communication.messages.outgoing.room.avatar.ChangePostureMessageComposer

package com.sulake.habbo.communication.messages.outgoing.room.avatar{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class ChangePostureMessageComposer implements IMessageComposer {

        private var _posture:int;

        public function ChangePostureMessageComposer(k:int);

        public function getMessageArray():Array;

        public function dispose():void;


    }
}//package com.sulake.habbo.communication.messages.outgoing.room.avatar

