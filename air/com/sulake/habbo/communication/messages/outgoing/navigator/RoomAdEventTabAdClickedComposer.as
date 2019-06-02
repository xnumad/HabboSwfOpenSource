//com.sulake.habbo.communication.messages.outgoing.navigator.RoomAdEventTabAdClickedComposer

package com.sulake.habbo.communication.messages.outgoing.navigator{
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.core.runtime.IDisposable;

    [SecureSWF(rename="true")]
    public class RoomAdEventTabAdClickedComposer implements IMessageComposer, IDisposable {

        private var _array:Array;

        public function RoomAdEventTabAdClickedComposer(k:int, _arg_2:String, _arg_3:int);

        public function getMessageArray():Array;

        public function dispose():void;

        public function get disposed():Boolean;


    }
}//package com.sulake.habbo.communication.messages.outgoing.navigator

