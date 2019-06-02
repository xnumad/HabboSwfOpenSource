//com.sulake.habbo.communication.messages.outgoing.room.layout.UpdateFloorPropertiesMessageComposer

package com.sulake.habbo.communication.messages.outgoing.room.layout{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class UpdateFloorPropertiesMessageComposer implements IMessageComposer {

        private var _array:Array;

        public function UpdateFloorPropertiesMessageComposer(k:String, _arg_2:int=-1, _arg_3:int=-1, _arg_4:int=-1, _arg_5:int=-1, _arg_6:int=-1, _arg_7:int=-1);

        public function getMessageArray():Array;

        public function dispose():void;


    }
}//package com.sulake.habbo.communication.messages.outgoing.room.layout

