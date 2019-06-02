//com.sulake.habbo.communication.messages.outgoing.help.GetQuizQuestionsComposer

package com.sulake.habbo.communication.messages.outgoing.help{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class GetQuizQuestionsComposer implements IMessageComposer {

        private var _array:Array;

        public function GetQuizQuestionsComposer(k:String);

        public function getMessageArray():Array;

        public function dispose():void;


    }
}//package com.sulake.habbo.communication.messages.outgoing.help

