//com.sulake.habbo.communication.messages.outgoing.room.engine.GetItemDataMessageComposer

package com.sulake.habbo.communication.messages.outgoing.room.engine{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class GetItemDataMessageComposer implements IMessageComposer {

        private var _objectId:int;

        public function GetItemDataMessageComposer(k:int);

        public function dispose():void;

        public function getMessageArray():Array;


    }
}//package com.sulake.habbo.communication.messages.outgoing.room.engine

