//com.sulake.habbo.avatareditor.IncomingMessages

package com.sulake.habbo.avatareditor{
    import com.sulake.habbo.communication.IHabboCommunicationManager;
    import com.sulake.habbo.communication.messages.incoming.avatar.WardrobeMessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.room.action.AvatarEffectMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.inventory.avatareffect.AvatarEffectExpiredMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.inventory.avatareffect.AvatarEffectsMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.inventory.avatareffect.AvatarEffectAddedMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.inventory.avatareffect.AvatarEffectActivatedMessageEvent;

    public class IncomingMessages {

        private var _context:HabboTabletAvatarEditor;
        private var _communication:IHabboCommunicationManager;

        public function IncomingMessages(k:HabboTabletAvatarEditor);

        public function dispose():void;

        private function onWardrobe(k:WardrobeMessageEvent):void;

        private function onRoomEnter(k:IMessageEvent):void;

        private function onRoomAvatarEffects(k:AvatarEffectMessageEvent):void;

        private function onAvatarEffectSelected(k:AvatarEffectExpiredMessageEvent):void;

        private function onAvatarEffects(k:AvatarEffectsMessageEvent):void;

        private function onAvatarEffectAdded(k:AvatarEffectAddedMessageEvent):void;

        private function onAvatarEffectActivated(k:AvatarEffectActivatedMessageEvent):void;

        private function onAvatarEffectExpired(k:AvatarEffectExpiredMessageEvent):void;


    }
}//package com.sulake.habbo.avatareditor

