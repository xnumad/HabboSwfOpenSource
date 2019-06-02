//com.sulake.habbo.communication.messages.incoming.navigator.RoomEventData

package com.sulake.habbo.communication.messages.incoming.navigator{
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class RoomEventData implements IDisposable {

        private var _adId:int;
        private var _ownerAvatarId:int;
        private var _ownerAvatarName:String;
        private var _flatId:int;
        private var _eventType:int;
        private var _eventName:String;
        private var _eventDescription:String;
        private var _creationTime:String;
        private var _expirationTime:Date;
        private var _disposed:Boolean;

        public function RoomEventData(k:IMessageDataWrapper);

        public function dispose():void;

        public function get disposed():Boolean;

        public function get adId():int;

        public function get ownerAvatarId():int;

        public function get ownerAvatarName():String;

        public function get flatId():int;

        public function get eventType():int;

        public function get eventName():String;

        public function get eventDescription():String;

        public function get creationTime():String;

        public function get expirationTime():Date;


    }
}//package com.sulake.habbo.communication.messages.incoming.navigator

