//com.sulake.habbo.communication.messages.outgoing.room.furniture.SetRoomBackgroundColorDataComposer

package com.sulake.habbo.communication.messages.outgoing.room.furniture{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class SetRoomBackgroundColorDataComposer implements IMessageComposer {

        private var _furniId:int;
        private var _hue:int;
        private var _saturation:int;
        private var _lightness:int;

        public function SetRoomBackgroundColorDataComposer(k:int, _arg_2:int, _arg_3:int, _arg_4:int);

        public function getMessageArray():Array;

        public function dispose():void;


    }
}//package com.sulake.habbo.communication.messages.outgoing.room.furniture

