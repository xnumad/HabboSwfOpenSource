//com.sulake.habbo.avatar.animation.IAnimation

package com.sulake.habbo.avatar.animation{
    import __AS3__.vec.Vector;

    public /*dynamic*/ interface IAnimation {

        function hasAvatarData():Boolean;
        function hasDirectionData():Boolean;
        function hasAddData():Boolean;
        function get id():String;
        function get spriteData():Vector.<ISpriteDataContainer>;
        function get removeData():Array;
        function get addData():Array;
        function get resetOnToggle():Boolean;

    }
}//package com.sulake.habbo.avatar.animation

