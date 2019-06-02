//com.sulake.habbo.communication.messages.incoming.avatar.OutfitData

package com.sulake.habbo.communication.messages.incoming.avatar{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class OutfitData {

        private var _slotId:int;
        private var _figureString:String;
        private var _gender:String;

        public function OutfitData(k:IMessageDataWrapper);

        public function get slotId():int;

        public function get figureString():String;

        public function get gender():String;


    }
}//package com.sulake.habbo.communication.messages.incoming.avatar

