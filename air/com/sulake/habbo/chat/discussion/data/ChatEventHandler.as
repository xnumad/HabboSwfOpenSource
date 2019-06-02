//com.sulake.habbo.chat.discussion.data.ChatEventHandler

package com.sulake.habbo.chat.discussion.data{
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.habbo.chat.Chat;
    import com.sulake.habbo.session.events.RoomSessionChatEvent;

    public class ChatEventHandler implements IDisposable {

        private var _component:Chat;

        public function ChatEventHandler(k:Chat);

        public function dispose():void;

        public function get disposed():Boolean;

        private function onRoomChat(k:RoomSessionChatEvent):void;


    }
}//package com.sulake.habbo.chat.discussion.data

