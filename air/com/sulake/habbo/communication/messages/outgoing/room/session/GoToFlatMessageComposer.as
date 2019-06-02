//com.sulake.habbo.communication.messages.outgoing.room.session.GoToFlatMessageComposer

package com.sulake.habbo.communication.messages.outgoing.room.session{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class GoToFlatMessageComposer implements IMessageComposer {

        private var _roomId:int;

        public function GoToFlatMessageComposer(k:int);

        public function dispose():void;

        public function getMessageArray():Array;


    }
}//package com.sulake.habbo.communication.messages.outgoing.room.session

