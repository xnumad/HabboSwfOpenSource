//com.sulake.habbo.communication.messages.incoming.moderation.RoomModerationData

package com.sulake.habbo.communication.messages.incoming.moderation{
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class RoomModerationData implements IDisposable {

        private var _flatId:int;
        private var _userCount:int;
        private var _ownerInRoom:Boolean;
        private var _ownerId:int;
        private var _ownerName:String;
        private var _room:RoomData;
        private var _disposed:Boolean;

        public function RoomModerationData(k:IMessageDataWrapper);

        public function get disposed():Boolean;

        public function dispose():void;

        public function get flatId():int;

        public function get userCount():int;

        public function get ownerInRoom():Boolean;

        public function get ownerId():int;

        public function get ownerName():String;

        public function get room():RoomData;


    }
}//package com.sulake.habbo.communication.messages.incoming.moderation

