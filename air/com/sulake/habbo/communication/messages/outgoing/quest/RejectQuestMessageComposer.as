//com.sulake.habbo.communication.messages.outgoing.quest.RejectQuestMessageComposer

package com.sulake.habbo.communication.messages.outgoing.quest{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class RejectQuestMessageComposer implements IMessageComposer {

        public function RejectQuestMessageComposer();

        public function getMessageArray():Array;

        public function dispose():void;


    }
}//package com.sulake.habbo.communication.messages.outgoing.quest

