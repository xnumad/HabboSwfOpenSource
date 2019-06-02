//com.sulake.habbo.communication.messages.outgoing.inventory.avatareffect.AvatarEffectActivatedComposer

package com.sulake.habbo.communication.messages.outgoing.inventory.avatareffect{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class AvatarEffectActivatedComposer implements IMessageComposer {

        private var _type:int;

        public function AvatarEffectActivatedComposer(k:int);

        public function dispose():void;

        public function getMessageArray():Array;


    }
}//package com.sulake.habbo.communication.messages.outgoing.inventory.avatareffect

