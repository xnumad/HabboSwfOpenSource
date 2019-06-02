//com.sulake.habbo.communication.messages.outgoing.roomsettings.UpdateRoomFilterMessageComposer

package com.sulake.habbo.communication.messages.outgoing.roomsettings{
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.core.runtime.IDisposable;

    [SecureSWF(rename="true")]
    public class UpdateRoomFilterMessageComposer implements IMessageComposer, IDisposable {

        public static var ADD_BAD_WORD:Boolean;
        public static var REMOVE_BAD_WORD:Boolean;

        private var _array:Array;

        public function UpdateRoomFilterMessageComposer(k:int, _arg_2:Boolean, _arg_3:String);

        public function getMessageArray():Array;

        public function dispose():void;

        public function get disposed():Boolean;


    }
}//package com.sulake.habbo.communication.messages.outgoing.roomsettings

