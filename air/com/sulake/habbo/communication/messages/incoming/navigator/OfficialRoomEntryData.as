//com.sulake.habbo.communication.messages.incoming.navigator.OfficialRoomEntryData

package com.sulake.habbo.communication.messages.incoming.navigator{
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class OfficialRoomEntryData implements IDisposable {

        public static const TYPE_TAG:int;
        public static const TYPE_GUEST_ROOM:int;
        public static const TYPE_FOLDER:int;

        private var _index:int;
        private var _popupCaption:String;
        private var _popupDesc:String;
        private var _showDetails:Boolean;
        private var _picText:String;
        private var _picRef:String;
        private var _folderId:int;
        private var _userCount:int;
        private var _type:int;
        private var _tag:String;
        private var _guestRoomData:GuestRoomData;
        private var _open:Boolean;
        private var _disposed:Boolean;

        public function OfficialRoomEntryData(k:IMessageDataWrapper);

        public function dispose():void;

        public function get disposed():Boolean;

        public function get type():int;

        public function get index():int;

        public function get popupCaption():String;

        public function get popupDesc():String;

        public function get showDetails():Boolean;

        public function get picText():String;

        public function get picRef():String;

        public function get folderId():int;

        public function get tag():String;

        public function get userCount():int;

        public function get guestRoomData():GuestRoomData;

        public function get open():Boolean;

        public function toggleOpen():void;

        public function get maxUsers():int;


    }
}//package com.sulake.habbo.communication.messages.incoming.navigator

