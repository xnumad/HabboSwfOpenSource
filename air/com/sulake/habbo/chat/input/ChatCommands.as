//com.sulake.habbo.chat.input.ChatCommands

package com.sulake.habbo.chat.input{
    import com.sulake.habbo.chat.Chat;
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.habbo.communication.messages.incoming.avatar.WardrobeMessageEvent;
    import com.sulake.room.object.IRoomObject;
    import com.sulake.habbo.session.IUserData;

    public class ChatCommands {

        private var _chat:Chat;
        private var _pendingWardrobeSlotIndex:int;

        public function ChatCommands(k:Chat);

        public function dispose():void;

        public function handleChatCommand(k:String):Boolean;

        private function isClubMember():Boolean;

        private function isRoomController():Boolean;

        private function send(k:IMessageComposer):void;

        private function sendSpecialCommandMessage(k:String):void;

        private function kick(k:String):void;

        private function clone(k:String):void;

        private function toWardrobe(k:int):void;

        private function fromWardrobe(k:int):void;

        private function onWardrobe(k:WardrobeMessageEvent):void;

        private function expression(k:int):void;

        private function clubExpression(k:int):void;

        private function showAccounts():void;

        private function showChangeLooks():void;

        private function showFriends():void;

        private function changeAccount(k:int):void;

        private function useEffect(k:int):void;

        private function getOwnUserId():int;

        private function getUserObj(k:int):IRoomObject;

        private function getUserDataByName(k:String):IUserData;

        private function getUserData(k:int):IUserData;


    }
}//package com.sulake.habbo.chat.input

