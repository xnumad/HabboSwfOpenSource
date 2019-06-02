//com.sulake.habbo.communication.messages.incoming.navigator.PopularRoomTagsData

package com.sulake.habbo.communication.messages.incoming.navigator{
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class PopularRoomTagsData implements IDisposable, MsgWithRequestId {

        private var _tags:Array;
        private var _disposed:Boolean;

        public function PopularRoomTagsData(k:IMessageDataWrapper);

        public function dispose():void;

        public function get disposed():Boolean;

        public function get tags():Array;


    }
}//package com.sulake.habbo.communication.messages.incoming.navigator

