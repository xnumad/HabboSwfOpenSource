//com.sulake.habbo.communication.messages.outgoing.facebook.FaceBookIsLoggedOffMessageComposer

package com.sulake.habbo.communication.messages.outgoing.facebook{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class FaceBookIsLoggedOffMessageComposer implements IMessageComposer {

        public function FaceBookIsLoggedOffMessageComposer();

        public function getMessageArray():Array;

        public function dispose():void;


    }
}//package com.sulake.habbo.communication.messages.outgoing.facebook

