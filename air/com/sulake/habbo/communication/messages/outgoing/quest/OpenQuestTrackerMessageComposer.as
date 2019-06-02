//com.sulake.habbo.communication.messages.outgoing.quest.OpenQuestTrackerMessageComposer

package com.sulake.habbo.communication.messages.outgoing.quest{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class OpenQuestTrackerMessageComposer implements IMessageComposer {

        public function OpenQuestTrackerMessageComposer();

        public function getMessageArray():Array;

        public function dispose():void;


    }
}//package com.sulake.habbo.communication.messages.outgoing.quest

