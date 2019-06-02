//com.sulake.habbo.communication.messages.outgoing.room.avatar.AvatarExpressionMessageComposer

package com.sulake.habbo.communication.messages.outgoing.room.avatar{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class AvatarExpressionMessageComposer implements IMessageComposer {

        private var _typeCode:int;

        public function AvatarExpressionMessageComposer(k:int);

        public function dispose():void;

        public function getMessageArray():Array;


    }
}//package com.sulake.habbo.communication.messages.outgoing.room.avatar

