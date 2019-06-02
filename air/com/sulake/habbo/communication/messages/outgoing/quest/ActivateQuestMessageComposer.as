//com.sulake.habbo.communication.messages.outgoing.quest.ActivateQuestMessageComposer

package com.sulake.habbo.communication.messages.outgoing.quest{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class ActivateQuestMessageComposer implements IMessageComposer {

        private var _data:Array;

        public function ActivateQuestMessageComposer(k:int);

        public function getMessageArray():Array;

        public function dispose():void;


    }
}//package com.sulake.habbo.communication.messages.outgoing.quest

