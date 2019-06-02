//com.sulake.habbo.communication.messages.outgoing.talent.GetTalentTrackLevelMessageComposer

package com.sulake.habbo.communication.messages.outgoing.talent{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class GetTalentTrackLevelMessageComposer implements IMessageComposer {

        private var _data:Array;

        public function GetTalentTrackLevelMessageComposer(k:String);

        public function getMessageArray():Array;

        public function dispose():void;


    }
}//package com.sulake.habbo.communication.messages.outgoing.talent

