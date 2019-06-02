//com.sulake.habbo.communication.messages.outgoing.users.GetHabboGroupDetailsMessageComposer

package com.sulake.habbo.communication.messages.outgoing.users{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class GetHabboGroupDetailsMessageComposer implements IMessageComposer {

        private var _data:Array;

        public function GetHabboGroupDetailsMessageComposer(k:int, _arg_2:Boolean);

        public function dispose():void;

        public function getMessageArray():Array;


    }
}//package com.sulake.habbo.communication.messages.outgoing.users

