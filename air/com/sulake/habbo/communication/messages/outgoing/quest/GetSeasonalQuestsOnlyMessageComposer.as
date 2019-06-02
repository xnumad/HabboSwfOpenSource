//com.sulake.habbo.communication.messages.outgoing.quest.GetSeasonalQuestsOnlyMessageComposer

package com.sulake.habbo.communication.messages.outgoing.quest{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class GetSeasonalQuestsOnlyMessageComposer implements IMessageComposer {

        public function GetSeasonalQuestsOnlyMessageComposer();

        public function getMessageArray():Array;

        public function dispose():void;


    }
}//package com.sulake.habbo.communication.messages.outgoing.quest

