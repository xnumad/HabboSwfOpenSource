//com.sulake.habbo.communication.messages.outgoing.room.engine.SetItemDataMessageComposer

package com.sulake.habbo.communication.messages.outgoing.room.engine{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class SetItemDataMessageComposer implements IMessageComposer {

        private var _objectId:int;
        private var _data:String;
        private var _colorHex:String;

        public function SetItemDataMessageComposer(k:int, _arg_2:String="", _arg_3:String="");

        public function dispose():void;

        public function getMessageArray():Array;


    }
}//package com.sulake.habbo.communication.messages.outgoing.room.engine

