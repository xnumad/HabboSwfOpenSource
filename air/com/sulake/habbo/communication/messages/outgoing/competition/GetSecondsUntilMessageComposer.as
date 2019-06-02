//com.sulake.habbo.communication.messages.outgoing.competition.GetSecondsUntilMessageComposer

package com.sulake.habbo.communication.messages.outgoing.competition{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class GetSecondsUntilMessageComposer implements IMessageComposer {

        private var _data:Array;

        public function GetSecondsUntilMessageComposer(k:String);

        public function getMessageArray():Array;

        public function dispose():void;


    }
}//package com.sulake.habbo.communication.messages.outgoing.competition

