//com.sulake.habbo.communication.messages.incoming.navigator.PromotedRoomCategoryData

package com.sulake.habbo.communication.messages.incoming.navigator{
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class PromotedRoomCategoryData implements IDisposable {

        private var _code:String;
        private var _leaderFigure:String;
        private var _bestRoom:GuestRoomData;
        private var _rooms:Array;
        private var _open:Boolean;
        private var _figurePending:Boolean;
        private var _disposed:Boolean;

        public function PromotedRoomCategoryData(k:IMessageDataWrapper);

        public function dispose():void;

        public function get disposed():Boolean;

        public function get code():String;

        public function get leaderFigure():String;

        public function get rooms():Array;

        public function get open():Boolean;

        public function set open(k:Boolean):void;

        public function toggleOpen():void;

        public function get bestRoom():GuestRoomData;

        public function get figurePending():Boolean;

        public function set figurePending(k:Boolean):void;


    }
}//package com.sulake.habbo.communication.messages.incoming.navigator

