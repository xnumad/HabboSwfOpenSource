//com.sulake.habbo.communication.messages.incoming.room.pets.RarityCategoryData

package com.sulake.habbo.communication.messages.incoming.room.pets{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class RarityCategoryData {

        private var _chance:int;
        private var _breeds:Array;

        public function RarityCategoryData(k:IMessageDataWrapper);

        public function dispose():void;

        public function get chance():int;

        public function get breeds():Array;


    }
}//package com.sulake.habbo.communication.messages.incoming.room.pets

