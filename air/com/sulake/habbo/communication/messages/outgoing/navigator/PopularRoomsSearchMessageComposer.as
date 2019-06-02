//com.sulake.habbo.communication.messages.outgoing.navigator.PopularRoomsSearchMessageComposer

package com.sulake.habbo.communication.messages.outgoing.navigator{
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.core.runtime.IDisposable;

    [SecureSWF(rename="true")]
    public class PopularRoomsSearchMessageComposer implements IMessageComposer, IDisposable {

        private var _array:Array;

        public function PopularRoomsSearchMessageComposer(k:String, _arg_2:int);

        public function getMessageArray():Array;

        public function dispose():void;

        public function get disposed():Boolean;


    }
}//package com.sulake.habbo.communication.messages.outgoing.navigator

