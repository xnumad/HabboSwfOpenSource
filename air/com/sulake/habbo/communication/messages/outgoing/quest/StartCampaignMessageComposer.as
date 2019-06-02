//com.sulake.habbo.communication.messages.outgoing.quest.StartCampaignMessageComposer

package com.sulake.habbo.communication.messages.outgoing.quest{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class StartCampaignMessageComposer implements IMessageComposer {

        private var _data:Array;

        public function StartCampaignMessageComposer(k:String);

        public function getMessageArray():Array;

        public function dispose():void;


    }
}//package com.sulake.habbo.communication.messages.outgoing.quest

