//com.sulake.habbo.communication.messages.outgoing.users.CreateGuildMessageComposer

package com.sulake.habbo.communication.messages.outgoing.users{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class CreateGuildMessageComposer implements IMessageComposer {

        private var _data:Array;

        public function CreateGuildMessageComposer(k:String, _arg_2:String, _arg_3:int, _arg_4:int, _arg_5:int, _arg_6:Array);

        public function getMessageArray():Array;

        public function dispose():void;


    }
}//package com.sulake.habbo.communication.messages.outgoing.users

