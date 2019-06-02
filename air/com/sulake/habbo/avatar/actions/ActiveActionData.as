//com.sulake.habbo.avatar.actions.ActiveActionData

package com.sulake.habbo.avatar.actions{
    public class ActiveActionData implements IActiveActionData {

        private static const INTERNAL_INT_ACTION_IDS:Array;

        private var _actionType:String;
        private var _actionParameter:String;
        private var _definition:IActionDefinition;
        private var _startFrame:int;
        private var _overridingAction:String;
        private var _serializedAction:String;
        private var _serializedId:String;
        private var _intActionId:int;

        public function ActiveActionData(k:String, _arg_2:String="", _arg_3:int=0);

        public function get actionType():String;

        public function get actionParameter():String;

        public function get definition():IActionDefinition;

        public function get id():String;

        public function set actionParameter(k:String):void;

        public function set definition(k:IActionDefinition):void;

        public function dispose():void;

        public function get startFrame():int;

        public function get overridingAction():String;

        public function set overridingAction(k:String):void;

        public function actionToString():String;

        public function actionToInt():int;


    }
}//package com.sulake.habbo.avatar.actions

