package com.sulake.habbo.avatar.actions
{
    public interface IActiveActionData 
    {
        function get id():String;
        function get actionType():String;
        function get actionParameter():String;
        function set actionParameter(_arg_1:String):void;
        function get startFrame():int;
        function get definition():IActionDefinition;
        function set definition(_arg_1:IActionDefinition):void;
        function get overridingAction():String;
        function set overridingAction(_arg_1:String):void;
    }
}
