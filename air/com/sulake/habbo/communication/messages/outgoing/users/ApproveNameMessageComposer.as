//com.sulake.habbo.communication.messages.outgoing.users.ApproveNameMessageComposer

package com.sulake.habbo.communication.messages.outgoing.users{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class ApproveNameMessageComposer implements IMessageComposer {

        private var _name:String;
        private var _type:int;

        public function ApproveNameMessageComposer(k:String, _arg_2:int);

        public function getMessageArray():Array;

        public function dispose():void;


    }
}//package com.sulake.habbo.communication.messages.outgoing.users

