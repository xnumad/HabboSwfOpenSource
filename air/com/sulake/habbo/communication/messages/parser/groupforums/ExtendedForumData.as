//com.sulake.habbo.communication.messages.parser.groupforums.ExtendedForumData

package com.sulake.habbo.communication.messages.parser.groupforums{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class ExtendedForumData extends ForumData {

        private var _readPermissions:int;
        private var _postMessagePermissions:int;
        private var _postThreadPermissions:int;
        private var _moderatePermissions:int;
        private var _readPermissionError:String;
        private var _postMessagePermissionError:String;
        private var _postThreadPermissionError:String;
        private var _moderatePermissionError:String;
        private var _reportPermissionError:String;
        private var _canChangeSettings:Boolean;
        private var _isStaff:Boolean;

        public function ExtendedForumData();

        public static function readFromMessage(k:IMessageDataWrapper):ExtendedForumData;


        public function get readPermissions():int;

        public function get postMessagePermissions():int;

        public function get postThreadPermissions():int;

        public function get moderatePermissions():int;

        public function get canRead():Boolean;

        public function get canReport():Boolean;

        public function get canPostMessage():Boolean;

        public function get canPostThread():Boolean;

        public function get canModerate():Boolean;

        public function get canChangeSettings():Boolean;

        public function get isStaff():Boolean;

        public function get readPermissionError():String;

        public function get postMessagePermissionError():String;

        public function get postThreadPermissionError():String;

        public function get moderatePermissionError():String;

        public function get reportPermissionError():String;


    }
}//package com.sulake.habbo.communication.messages.parser.groupforums

