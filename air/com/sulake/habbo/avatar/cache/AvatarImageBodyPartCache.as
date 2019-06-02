//com.sulake.habbo.avatar.cache.AvatarImageBodyPartCache

package com.sulake.habbo.avatar.cache{
    import com.sulake.core.utils.Map;
    import com.sulake.habbo.avatar.actions.IActiveActionData;

    public class AvatarImageBodyPartCache {

        private var _cache:Map;
        private var _currentAction:IActiveActionData;
        private var _currentDirection:int;
        private var _disposed:Boolean;

        public function AvatarImageBodyPartCache();

        public function setAction(k:IActiveActionData):void;

        public function dispose():void;

        public function disposeActions(k:int, _arg_2:int):void;

        public function getAction():IActiveActionData;

        public function setDirection(k:int):void;

        public function getDirection():int;

        public function getActionCache(k:IActiveActionData=null):AvatarImageActionCache;

        public function updateActionCache(k:IActiveActionData, _arg_2:AvatarImageActionCache):void;

        private function debugInfo(k:String):void;


    }
}//package com.sulake.habbo.avatar.cache

