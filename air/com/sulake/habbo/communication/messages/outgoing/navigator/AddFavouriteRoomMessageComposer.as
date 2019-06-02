//com.sulake.habbo.communication.messages.outgoing.navigator.AddFavouriteRoomMessageComposer

package com.sulake.habbo.communication.messages.outgoing.navigator{
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.core.runtime.IDisposable;

    [SecureSWF(rename="true")]
    public class AddFavouriteRoomMessageComposer implements IMessageComposer, IDisposable {

        private var _array:Array;

        public function AddFavouriteRoomMessageComposer(k:int);

        public function getMessageArray():Array;

        public function dispose():void;

        public function get disposed():Boolean;


    }
}//package com.sulake.habbo.communication.messages.outgoing.navigator

