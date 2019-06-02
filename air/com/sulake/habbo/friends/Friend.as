//com.sulake.habbo.friends.Friend

package com.sulake.habbo.friends{
    import com.sulake.core.runtime.IDisposable;
    import flash.display.BitmapData;
    import starling.textures.Texture;
    import com.sulake.habbo.communication.messages.incoming.friendlist.FriendData;

    public class Friend implements IDisposable {

        public static const GENDER_FEMALE:int;
        public static const GENDER_MALE:int;

        private var _id:int;
        private var _name:String;
        private var _sortableName:String;
        private var _gender:int;
        private var _online:Boolean;
        private var _followingAllowed:Boolean;
        private var _figure:String;
        private var _motto:String;
        private var _lastAccess:String;
        private var _categoryId:int;
        private var _selected:Boolean;
        private var _disposed:Boolean;
        private var _face:BitmapData;
        private var _realName:String;
        private var _persistedMessageUser:Boolean;
        private var _pocketHabboUser:Boolean;
        private var _vipMember:Boolean;
        private var _relationshipStatus:int;
        private var _thumbnail:Texture;

        public function Friend(k:FriendData);

        public function dispose():void;

        public function get disposed():Boolean;

        public function get id():int;

        public function get name():String;

        public function get sortableName():String;

        public function get gender():int;

        public function get online():Boolean;

        public function get followingAllowed():Boolean;

        public function get figure():String;

        public function get motto():String;

        public function get lastAccess():String;

        public function get categoryId():int;

        public function get selected():Boolean;

        public function get face():BitmapData;

        public function get realName():String;

        public function get persistedMessageUser():Boolean;

        public function get pocketHabboUser():Boolean;

        public function get relationshipStatus():int;

        public function get vipMember():Boolean;

        public function set id(k:int):void;

        public function set name(k:String):void;

        public function set gender(k:int):void;

        public function set online(k:Boolean):void;

        public function set followingAllowed(k:Boolean):void;

        public function set figure(k:String):void;

        public function set motto(k:String):void;

        public function set lastAccess(k:String):void;

        public function set categoryId(k:int):void;

        public function set selected(k:Boolean):void;

        public function set face(k:BitmapData):void;

        public function set realName(k:String):void;

        public function set persistedMessageUser(k:Boolean):void;

        public function set pocketHabboUser(k:Boolean):void;

        public function set vipMember(k:Boolean):void;

        public function get thumbnail():Texture;

        public function set thumbnail(k:Texture):void;


    }
}//package com.sulake.habbo.friends

