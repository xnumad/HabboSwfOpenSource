//com.sulake.habbo.avatar.IAvatarFigureContainer

package com.sulake.habbo.avatar{
    public /*dynamic*/ interface IAvatarFigureContainer {

        function getPartTypeIds():Array;
        function hasPartType(k:String):Boolean;
        function getPartSetId(k:String):int;
        function getPartColorIds(k:String):Array;
        function updatePart(k:String, _arg_2:int, _arg_3:Array):void;
        function removePart(k:String):void;
        function getFigureString():String;

    }
}//package com.sulake.habbo.avatar

