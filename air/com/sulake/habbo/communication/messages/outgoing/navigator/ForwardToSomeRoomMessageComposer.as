//com.sulake.habbo.communication.messages.outgoing.navigator.ForwardToSomeRoomMessageComposer

package com.sulake.habbo.communication.messages.outgoing.navigator{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class ForwardToSomeRoomMessageComposer implements IMessageComposer {

        private var _type:String;

        public function ForwardToSomeRoomMessageComposer(k:String):void;

        public function getMessageArray():Array;

        public function dispose():void;


    }
}//package com.sulake.habbo.communication.messages.outgoing.navigator

