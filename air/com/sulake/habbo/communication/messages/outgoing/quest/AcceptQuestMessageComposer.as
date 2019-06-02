//com.sulake.habbo.communication.messages.outgoing.quest.AcceptQuestMessageComposer

package com.sulake.habbo.communication.messages.outgoing.quest{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class AcceptQuestMessageComposer implements IMessageComposer {

        private var _data:Array;

        public function AcceptQuestMessageComposer(k:int);

        public function getMessageArray():Array;

        public function dispose():void;


    }
}//package com.sulake.habbo.communication.messages.outgoing.quest

