//com.sulake.habbo.communication.messages.outgoing.room.engine.RemoveBotFromFlatMessageComposer

package com.sulake.habbo.communication.messages.outgoing.room.engine{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class RemoveBotFromFlatMessageComposer implements IMessageComposer {

        private var _botId:int;

        public function RemoveBotFromFlatMessageComposer(k:int);

        public function dispose():void;

        public function getMessageArray():Array;


    }
}//package com.sulake.habbo.communication.messages.outgoing.room.engine

