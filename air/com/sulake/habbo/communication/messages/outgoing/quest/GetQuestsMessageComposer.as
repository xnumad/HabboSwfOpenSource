//com.sulake.habbo.communication.messages.outgoing.quest.GetQuestsMessageComposer

package com.sulake.habbo.communication.messages.outgoing.quest{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class GetQuestsMessageComposer implements IMessageComposer {

        public function GetQuestsMessageComposer();

        public function getMessageArray():Array;

        public function dispose():void;


    }
}//package com.sulake.habbo.communication.messages.outgoing.quest

