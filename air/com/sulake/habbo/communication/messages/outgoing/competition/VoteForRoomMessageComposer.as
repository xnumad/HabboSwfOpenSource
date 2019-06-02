//com.sulake.habbo.communication.messages.outgoing.competition.VoteForRoomMessageComposer

package com.sulake.habbo.communication.messages.outgoing.competition{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class VoteForRoomMessageComposer implements IMessageComposer {

        private var _data:Array;

        public function VoteForRoomMessageComposer(k:String);

        public function getMessageArray():Array;

        public function dispose():void;


    }
}//package com.sulake.habbo.communication.messages.outgoing.competition

