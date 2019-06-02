//com.sulake.habbo.communication.messages.outgoing.help.GetFaqTextMessageComposer

package com.sulake.habbo.communication.messages.outgoing.help{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class GetFaqTextMessageComposer implements IMessageComposer {

        private var _questionId:int;

        public function GetFaqTextMessageComposer(k:int);

        public function getMessageArray():Array;

        public function dispose():void;


    }
}//package com.sulake.habbo.communication.messages.outgoing.help

