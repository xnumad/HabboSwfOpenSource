//com.sulake.habbo.communication.messages.parser.moderation.IssueMessageData

package com.sulake.habbo.communication.messages.parser.moderation{
    import com.sulake.core.runtime.IDisposable;

    public class IssueMessageData implements IDisposable {

        public static const STATE_OPEN:int;
        public static const STATE_PICKED:int;
        public static const STATE_CLOSED:int;

        private var _issueId:int;
        private var _state:int;
        private var _categoryId:int;
        private var _reportedCategoryId:int;
        private var _issueAgeInMilliseconds:Number;
        private var _priority:int;
        private var _groupingId:int;
        private var _reporterUserId:int;
        private var _reporterUserName:String;
        private var _reportedUserId:int;
        private var _reportedUserName:String;
        private var _pickerUserId:int;
        private var _pickerUserName:String;
        private var _message:String;
        private var _chatRecordId:int;
        private var _patterns:Array;
        private var _isDisposed:Boolean;
        private var _creationTimeInMilliseconds:Number;

        public function IssueMessageData(k:int, _arg_2:int, _arg_3:int, _arg_4:int, _arg_5:Number, _arg_6:int, _arg_7:int, _arg_8:int, _arg_9:String, k0:int, k1:String, k2:int, k3:String, k4:String, k5:int, k6:Array);

        public function get issueId():int;

        public function get state():int;

        public function get categoryId():int;

        public function get reportedCategoryId():int;

        public function get issueAgeInMilliseconds():Number;

        public function get priority():int;

        public function get groupingId():int;

        public function get reporterUserId():int;

        public function get reporterUserName():String;

        public function get reportedUserId():int;

        public function get reportedUserName():String;

        public function get pickerUserId():int;

        public function get pickerUserName():String;

        public function get message():String;

        public function get chatRecordId():int;

        public function get patterns():Array;

        public function dispose():void;

        public function get disposed():Boolean;

        public function getOpenTime(k:int):String;


    }
}//package com.sulake.habbo.communication.messages.parser.moderation

