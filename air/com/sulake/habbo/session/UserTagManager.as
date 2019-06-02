//com.sulake.habbo.session.UserTagManager

package com.sulake.habbo.session{
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.core.utils.Map;

    public class UserTagManager implements IDisposable {

        private var _tagMap:Map;
        private var _sessionDataManager:SessionDataManager;

        public function UserTagManager(k:SessionDataManager);

        public function getTags(k:int):Array;

        public function dispose():void;

        public function get disposed():Boolean;

        public function updateUserTags(k:int, _arg_2:Array):void;


    }
}//package com.sulake.habbo.session

