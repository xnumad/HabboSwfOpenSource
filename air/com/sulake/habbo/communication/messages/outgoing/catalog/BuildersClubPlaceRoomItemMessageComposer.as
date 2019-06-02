//com.sulake.habbo.communication.messages.outgoing.catalog.BuildersClubPlaceRoomItemMessageComposer

package com.sulake.habbo.communication.messages.outgoing.catalog{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class BuildersClubPlaceRoomItemMessageComposer implements IMessageComposer {

        private var _data:Array;

        public function BuildersClubPlaceRoomItemMessageComposer(k:int, _arg_2:int, _arg_3:String, _arg_4:int, _arg_5:int, _arg_6:int);

        public function getMessageArray():Array;

        public function dispose():void;


    }
}//package com.sulake.habbo.communication.messages.outgoing.catalog

