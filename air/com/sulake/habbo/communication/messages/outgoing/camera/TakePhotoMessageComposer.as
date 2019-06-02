//com.sulake.habbo.communication.messages.outgoing.camera.TakePhotoMessageComposer

package com.sulake.habbo.communication.messages.outgoing.camera{
    import com.sulake.core.communication.messages.IMessageComposer;
    import flash.utils.ByteArray;

    [SecureSWF(rename="true")]
    public class TakePhotoMessageComposer implements IMessageComposer {

        private var _data:Array;

        public function TakePhotoMessageComposer(k:ByteArray);

        public function getMessageArray():Array;

        public function dispose():void;


    }
}//package com.sulake.habbo.communication.messages.outgoing.camera

