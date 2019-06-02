//com.sulake.habbo.communication.messages.incoming.quest.HallOfFameEntryData

package com.sulake.habbo.communication.messages.incoming.quest{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class HallOfFameEntryData implements ILandingPageUserEntry {

        private var _userId:int;
        private var _userName:String;
        private var _figure:String;
        private var _rank:int;
        private var _currentScore:int;

        public function HallOfFameEntryData(k:IMessageDataWrapper);

        public function get userId():int;

        public function get userName():String;

        public function get figure():String;

        public function get rank():int;

        public function get currentScore():int;


    }
}//package com.sulake.habbo.communication.messages.incoming.quest

