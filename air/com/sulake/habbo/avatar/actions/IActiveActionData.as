//com.sulake.habbo.avatar.actions.IActiveActionData

package com.sulake.habbo.avatar.actions{
    public /*dynamic*/ interface IActiveActionData {

        function get id():String;
        function get actionType():String;
        function get actionParameter():String;
        function set actionParameter(k:String):void;
        function get startFrame():int;
        function get definition():IActionDefinition;
        function set definition(k:IActionDefinition):void;
        function get overridingAction():String;
        function set overridingAction(k:String):void;

    }
}//package com.sulake.habbo.avatar.actions

