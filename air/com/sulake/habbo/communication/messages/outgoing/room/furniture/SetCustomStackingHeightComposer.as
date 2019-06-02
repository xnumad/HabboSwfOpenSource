//com.sulake.habbo.communication.messages.outgoing.room.furniture.SetCustomStackingHeightComposer

package com.sulake.habbo.communication.messages.outgoing.room.furniture{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class SetCustomStackingHeightComposer implements IMessageComposer {

        private var _data:Array;

        public function SetCustomStackingHeightComposer(k:int, _arg_2:int=-100);

        public function getMessageArray():Array;

        public function dispose():void;


    }
}//package com.sulake.habbo.communication.messages.outgoing.room.furniture

