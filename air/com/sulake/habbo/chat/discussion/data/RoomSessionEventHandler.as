//com.sulake.habbo.chat.discussion.data.RoomSessionEventHandler

package com.sulake.habbo.chat.discussion.data{
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.habbo.chat.Chat;
    import com.sulake.habbo.session.events.RoomSessionEvent;

    public class RoomSessionEventHandler implements IDisposable {

        private var _component:Chat;

        public function RoomSessionEventHandler(k:Chat);

        public function dispose():void;

        public function get disposed():Boolean;

        private function onRoomSessionCreated(k:RoomSessionEvent):void;

        private function onRoomSessionEnded(k:RoomSessionEvent):void;


    }
}//package com.sulake.habbo.chat.discussion.data

