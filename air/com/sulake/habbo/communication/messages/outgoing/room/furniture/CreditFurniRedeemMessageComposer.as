//com.sulake.habbo.communication.messages.outgoing.room.furniture.CreditFurniRedeemMessageComposer

package com.sulake.habbo.communication.messages.outgoing.room.furniture{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class CreditFurniRedeemMessageComposer implements IMessageComposer {

        private var _objectId:int;

        public function CreditFurniRedeemMessageComposer(k:int);

        public function dispose():void;

        public function getMessageArray():Array;


    }
}//package com.sulake.habbo.communication.messages.outgoing.room.furniture

