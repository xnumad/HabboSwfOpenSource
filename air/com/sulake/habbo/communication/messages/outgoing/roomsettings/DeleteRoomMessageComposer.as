//com.sulake.habbo.communication.messages.outgoing.roomsettings.DeleteRoomMessageComposer

package com.sulake.habbo.communication.messages.outgoing.roomsettings{
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.core.runtime.IDisposable;

    [SecureSWF(rename="true")]
    public class DeleteRoomMessageComposer implements IMessageComposer, IDisposable {

        private var _array:Array;

        public function DeleteRoomMessageComposer(k:int);

        public function getMessageArray():Array;

        public function dispose():void;

        public function get disposed():Boolean;


    }
}//package com.sulake.habbo.communication.messages.outgoing.roomsettings

