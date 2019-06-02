//com.sulake.habbo.communication.messages.outgoing.help.PostQuizAnswersComposer

package com.sulake.habbo.communication.messages.outgoing.help{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class PostQuizAnswersComposer implements IMessageComposer {

        private var _array:Array;

        public function PostQuizAnswersComposer(k:String, _arg_2:Array);

        public function getMessageArray():Array;

        public function dispose():void;


    }
}//package com.sulake.habbo.communication.messages.outgoing.help

