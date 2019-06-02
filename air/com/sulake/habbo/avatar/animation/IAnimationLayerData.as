//com.sulake.habbo.avatar.animation.IAnimationLayerData

package com.sulake.habbo.avatar.animation{
    import com.sulake.habbo.avatar.actions.IActiveActionData;

    public /*dynamic*/ interface IAnimationLayerData {

        function get id():String;
        function get action():IActiveActionData;
        function get animationFrame():int;
        function get dx():int;
        function get dy():int;
        function get dz():int;
        function get directionOffset():int;

    }
}//package com.sulake.habbo.avatar.animation

