//com.sulake.habbo.communication.messages.outgoing.room.engine.SetClothingChangeDataMessageComposer

package com.sulake.habbo.communication.messages.outgoing.room.engine{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class SetClothingChangeDataMessageComposer implements IMessageComposer {

        private var _objectId:int;
        private var _gender:String;
        private var _clothes:String;

        public function SetClothingChangeDataMessageComposer(k:int, _arg_2:String, _arg_3:String="");

        public function dispose():void;

        public function getMessageArray():Array;


    }
}//package com.sulake.habbo.communication.messages.outgoing.room.engine

