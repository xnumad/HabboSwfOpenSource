//com.sulake.habbo.avatar.actions.ActionType

package com.sulake.habbo.avatar.actions{
    import __AS3__.vec.Vector;

    public class ActionType {

        private var _id:int;
        private var _value:int;
        private var _prevents:Vector.<String>;
        private var _preventHeadTurn:Boolean;
        private var _isAnimated:Boolean;

        public function ActionType(k:XML);

        public function get id():int;

        public function get value():int;

        public function get prevents():Vector.<String>;

        public function get preventHeadTurn():Boolean;

        public function get isAnimated():Boolean;


    }
}//package com.sulake.habbo.avatar.actions

