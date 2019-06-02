//com.sulake.habbo.communication.messages.incoming.navigator.CompetitionRoomsData

package com.sulake.habbo.communication.messages.incoming.navigator{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class CompetitionRoomsData {

        private var _goalId:int;
        private var _pageIndex:int;
        private var _pageCount:int;

        public function CompetitionRoomsData(k:IMessageDataWrapper, _arg_2:int=0, _arg_3:int=0);

        public function get goalId():int;

        public function get pageIndex():int;

        public function get pageCount():int;


    }
}//package com.sulake.habbo.communication.messages.incoming.navigator

