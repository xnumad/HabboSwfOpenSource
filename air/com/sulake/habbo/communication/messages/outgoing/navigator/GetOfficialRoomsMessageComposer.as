//com.sulake.habbo.communication.messages.outgoing.navigator.GetOfficialRoomsMessageComposer

package com.sulake.habbo.communication.messages.outgoing.navigator{
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.core.runtime.IDisposable;

    [SecureSWF(rename="true")]
    public class GetOfficialRoomsMessageComposer implements IMessageComposer, IDisposable {

        private var _array:Array;

        public function GetOfficialRoomsMessageComposer(k:int=0);

        public function getMessageArray():Array;

        public function dispose():void;

        public function get disposed():Boolean;


    }
}//package com.sulake.habbo.communication.messages.outgoing.navigator

