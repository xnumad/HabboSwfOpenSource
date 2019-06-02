//com.sulake.habbo.communication.messages.outgoing.room.furniture.OpenPetPackageMessageComposer

package com.sulake.habbo.communication.messages.outgoing.room.furniture{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class OpenPetPackageMessageComposer implements IMessageComposer {

        private var _objectId:int;
        private var _petName:String;

        public function OpenPetPackageMessageComposer(k:int, _arg_2:String);

        public function getMessageArray():Array;

        public function dispose():void;


    }
}//package com.sulake.habbo.communication.messages.outgoing.room.furniture

