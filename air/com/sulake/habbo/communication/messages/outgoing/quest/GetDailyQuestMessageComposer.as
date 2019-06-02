//com.sulake.habbo.communication.messages.outgoing.quest.GetDailyQuestMessageComposer

package com.sulake.habbo.communication.messages.outgoing.quest{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class GetDailyQuestMessageComposer implements IMessageComposer {

        private var _data:Array;

        public function GetDailyQuestMessageComposer(k:Boolean, _arg_2:int);

        public function getMessageArray():Array;

        public function dispose():void;


    }
}//package com.sulake.habbo.communication.messages.outgoing.quest

