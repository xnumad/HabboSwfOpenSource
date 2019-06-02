//com.sulake.habbo.communication.messages.outgoing.quest.CancelQuestMessageComposer

package com.sulake.habbo.communication.messages.outgoing.quest{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class CancelQuestMessageComposer implements IMessageComposer {

        public function CancelQuestMessageComposer();

        public function getMessageArray():Array;

        public function dispose():void;


    }
}//package com.sulake.habbo.communication.messages.outgoing.quest

