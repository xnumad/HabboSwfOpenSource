//com.sulake.habbo.communication.messages.outgoing.roomdirectory.RoomNetworkOpenConnectionMessageComposer

package com.sulake.habbo.communication.messages.outgoing.roomdirectory{
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.core.runtime.IDisposable;

    [SecureSWF(rename="true")]
    public class RoomNetworkOpenConnectionMessageComposer implements IMessageComposer, IDisposable {

        private var _array:Array;

        public function RoomNetworkOpenConnectionMessageComposer(k:int, _arg_2:int);

        public function getMessageArray():Array;

        public function dispose():void;

        public function get disposed():Boolean;


    }
}//package com.sulake.habbo.communication.messages.outgoing.roomdirectory

