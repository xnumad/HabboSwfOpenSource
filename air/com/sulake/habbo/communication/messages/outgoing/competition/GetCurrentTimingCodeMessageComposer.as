//com.sulake.habbo.communication.messages.outgoing.competition.GetCurrentTimingCodeMessageComposer

package com.sulake.habbo.communication.messages.outgoing.competition{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class GetCurrentTimingCodeMessageComposer implements IMessageComposer {

        private var _data:Array;

        public function GetCurrentTimingCodeMessageComposer(k:String);

        public function getMessageArray():Array;

        public function dispose():void;


    }
}//package com.sulake.habbo.communication.messages.outgoing.competition

