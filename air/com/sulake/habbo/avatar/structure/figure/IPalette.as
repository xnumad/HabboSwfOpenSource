//com.sulake.habbo.avatar.structure.figure.IPalette

package com.sulake.habbo.avatar.structure.figure{
    import flash.utils.Dictionary;

    public /*dynamic*/ interface IPalette {

        function get id():int;
        function getColor(k:int):IPartColor;
        function get colors():Dictionary;

    }
}//package com.sulake.habbo.avatar.structure.figure

