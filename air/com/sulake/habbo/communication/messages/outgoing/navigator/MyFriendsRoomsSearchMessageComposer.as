//com.sulake.habbo.communication.messages.outgoing.navigator.MyFriendsRoomsSearchMessageComposer

package com.sulake.habbo.communication.messages.outgoing.navigator{
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.core.runtime.IDisposable;

    [SecureSWF(rename="true")]
    public class MyFriendsRoomsSearchMessageComposer implements IMessageComposer, IDisposable {

        private var _array:Array;

        public function MyFriendsRoomsSearchMessageComposer();

        public function getMessageArray():Array;

        public function dispose():void;

        public function get disposed():Boolean;


    }
}//package com.sulake.habbo.communication.messages.outgoing.navigator

