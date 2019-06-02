//com.sulake.habbo.communication.messages.outgoing.room.engine.PlaceBotMessageComposer

package com.sulake.habbo.communication.messages.outgoing.room.engine{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class PlaceBotMessageComposer implements IMessageComposer {

        private var _botId:int;
        private var _x:int;
        private var _y:int;

        public function PlaceBotMessageComposer(k:int, _arg_2:int, _arg_3:int);

        public function dispose():void;

        public function getMessageArray():Array;


    }
}//package com.sulake.habbo.communication.messages.outgoing.room.engine

