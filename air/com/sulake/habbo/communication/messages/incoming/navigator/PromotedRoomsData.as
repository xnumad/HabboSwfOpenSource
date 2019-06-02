//com.sulake.habbo.communication.messages.incoming.navigator.PromotedRoomsData

package com.sulake.habbo.communication.messages.incoming.navigator{
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class PromotedRoomsData implements IDisposable, MsgWithRequestId {

        private var _entries:Array;
        private var _disposed:Boolean;

        public function PromotedRoomsData(k:IMessageDataWrapper);

        public function dispose():void;

        public function get disposed():Boolean;

        public function get entries():Array;


    }
}//package com.sulake.habbo.communication.messages.incoming.navigator

