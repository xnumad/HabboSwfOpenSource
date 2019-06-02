//com.sulake.habbo.communication.messages.outgoing.room.furniture.SetMannequinNameComposer

package com.sulake.habbo.communication.messages.outgoing.room.furniture{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class SetMannequinNameComposer implements IMessageComposer {

        private var _furniId:int;
        private var _name:String;

        public function SetMannequinNameComposer(k:int, _arg_2:String);

        public function getMessageArray():Array;

        public function dispose():void;


    }
}//package com.sulake.habbo.communication.messages.outgoing.room.furniture

