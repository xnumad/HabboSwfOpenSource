//com.sulake.habbo.communication.messages.parser.talent.TalentTrack

package com.sulake.habbo.communication.messages.parser.talent{
    import __AS3__.vec.Vector;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class TalentTrack {

        public static const STATE_LOCKED:int;
        public static const STATE_ONGOING:int;
        public static const STATE_ACHIEVED:int;

        private var _name:String;
        private var _currentLevelIndex:int;
        private var _levels:Vector.<TalentTrackLevel>;

        public function TalentTrack();

        public function parse(k:IMessageDataWrapper):void;

        public function findTaskByAchievementId(k:int):TalentTrackTask;

        public function get name():String;

        public function get levels():Vector.<TalentTrackLevel>;

        public function get progressPerLevel():Number;

        public function get totalProgress():Number;

        public function get progressForCurrentLevel():Number;

        public function removeFirstLevel():void;


    }
}//package com.sulake.habbo.communication.messages.parser.talent

