//com.sulake.habbo.communication.messages.outgoing.catalog.BuildersClubPlaceWallItemMessageComposer

package com.sulake.habbo.communication.messages.outgoing.catalog{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class BuildersClubPlaceWallItemMessageComposer implements IMessageComposer {

        private var _data:Array;

        public function BuildersClubPlaceWallItemMessageComposer(k:int, _arg_2:int, _arg_3:String, _arg_4:String);

        public function getMessageArray():Array;

        public function dispose():void;


    }
}//package com.sulake.habbo.communication.messages.outgoing.catalog

