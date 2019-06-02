//com.sulake.habbo.avatar.actions.IActionDefinition

package com.sulake.habbo.avatar.actions{
    import __AS3__.vec.Vector;

    public /*dynamic*/ interface IActionDefinition {

        function get id():String;
        function get state():String;
        function get precedence():int;
        function get activePartSet():String;
        function get isMain():Boolean;
        function get isDefault():Boolean;
        function get assetPartDefinition():String;
        function get lay():String;
        function get geometryType():String;
        function get isAnimation():Boolean;
        function get startFromFrameZero():Boolean;
        function isAnimated(k:String):Boolean;
        function getPrevents(k:String):Vector.<String>;
        function getPreventHeadTurn(k:String):Boolean;
        function setOffsets(k:String, _arg_2:int, _arg_3:Array):void;
        function getOffsets(k:String, _arg_2:int):Array;

    }
}//package com.sulake.habbo.avatar.actions

