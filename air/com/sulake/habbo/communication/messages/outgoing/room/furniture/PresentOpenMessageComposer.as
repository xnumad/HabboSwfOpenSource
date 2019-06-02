//com.sulake.habbo.communication.messages.outgoing.room.furniture.PresentOpenMessageComposer

package com.sulake.habbo.communication.messages.outgoing.room.furniture{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class PresentOpenMessageComposer implements IMessageComposer {

        private var _objectId:int;

        public function PresentOpenMessageComposer(k:int);

        public function dispose():void;

        public function getMessageArray():Array;


    }
}//package com.sulake.habbo.communication.messages.outgoing.room.furniture

