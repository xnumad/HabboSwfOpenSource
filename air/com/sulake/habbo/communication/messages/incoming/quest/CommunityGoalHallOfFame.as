//com.sulake.habbo.communication.messages.incoming.quest.CommunityGoalHallOfFame

package com.sulake.habbo.communication.messages.incoming.quest{
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class CommunityGoalHallOfFame implements IDisposable {

        private var _goalCode:String;
        private var _hof:Array;

        public function CommunityGoalHallOfFame(k:IMessageDataWrapper):void;

        public function dispose():void;

        public function get disposed():Boolean;

        public function get hof():Array;

        public function get goalCode():String;


    }
}//package com.sulake.habbo.communication.messages.incoming.quest

