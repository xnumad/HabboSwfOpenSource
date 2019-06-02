//com.sulake.habbo.communication.messages.outgoing.facebook.FaceBookInitiateAddFriendsMessageComposer

package com.sulake.habbo.communication.messages.outgoing.facebook{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class FaceBookInitiateAddFriendsMessageComposer implements IMessageComposer {

        public function FaceBookInitiateAddFriendsMessageComposer();

        public function getMessageArray():Array;

        public function dispose():void;


    }
}//package com.sulake.habbo.communication.messages.outgoing.facebook

