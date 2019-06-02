//com.sulake.habbo.communication.messages.outgoing.room.action.BanUserWithDurationMessageComposer

package com.sulake.habbo.communication.messages.outgoing.room.action{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class BanUserWithDurationMessageComposer implements IMessageComposer {

        private var _userId:int;
        private var _roomId:int;
        private var _banType:String;

        public function BanUserWithDurationMessageComposer(k:int, _arg_2:String, _arg_3:int=0);

        public function dispose():void;

        public function getMessageArray():Array;


    }
}//package com.sulake.habbo.communication.messages.outgoing.room.action

