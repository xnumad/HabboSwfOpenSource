//com.sulake.habbo.communication.messages.outgoing.room.session.QuitMessageComposer

package com.sulake.habbo.communication.messages.outgoing.room.session{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class QuitMessageComposer implements IMessageComposer {

        public function QuitMessageComposer();

        public function getMessageArray():Array;

        public function dispose():void;

        public function get disposed():Boolean;


    }
}//package com.sulake.habbo.communication.messages.outgoing.room.session

