//com.sulake.habbo.communication.messages.outgoing.friendlist.MessengerInitMessageComposer

package com.sulake.habbo.communication.messages.outgoing.friendlist{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class MessengerInitMessageComposer implements IMessageComposer {

        public function MessengerInitMessageComposer();

        public function dispose():void;

        public function getMessageArray():Array;


    }
}//package com.sulake.habbo.communication.messages.outgoing.friendlist

