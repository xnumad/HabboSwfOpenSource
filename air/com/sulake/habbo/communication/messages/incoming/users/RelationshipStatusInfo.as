//com.sulake.habbo.communication.messages.incoming.users.RelationshipStatusInfo

package com.sulake.habbo.communication.messages.incoming.users{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class RelationshipStatusInfo {

        private var _relationshipStatusType:int;
        private var _friendCount:int;
        private var _randomFriendId:int;
        private var _randomFriendName:String;
        private var _randomFriendFigure:String;

        public function RelationshipStatusInfo(k:IMessageDataWrapper);

        public function get relationshipStatusType():int;

        public function get friendCount():int;

        public function get randomFriendId():int;

        public function get randomFriendName():String;

        public function get randomFriendFigure():String;


    }
}//package com.sulake.habbo.communication.messages.incoming.users

