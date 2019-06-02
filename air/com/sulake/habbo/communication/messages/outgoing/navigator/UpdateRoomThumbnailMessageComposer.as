//com.sulake.habbo.communication.messages.outgoing.navigator.UpdateRoomThumbnailMessageComposer

package com.sulake.habbo.communication.messages.outgoing.navigator{
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.core.runtime.IDisposable;

    [SecureSWF(rename="true")]
    public class UpdateRoomThumbnailMessageComposer implements IMessageComposer, IDisposable {

        private var _array:Array;

        public function UpdateRoomThumbnailMessageComposer(k:int, _arg_2:int, _arg_3:int, _arg_4:int);

        public function addObj(k:int, _arg_2:int):void;

        public function getMessageArray():Array;

        public function dispose():void;

        public function get disposed():Boolean;


    }
}//package com.sulake.habbo.communication.messages.outgoing.navigator

