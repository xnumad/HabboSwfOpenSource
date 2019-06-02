//com.sulake.habbo.freeflowchat.style.IChatStyle

package com.sulake.habbo.freeflowchat.style{
    import flash.display.BitmapData;
    import flash.display.Sprite;
    import flash.geom.Rectangle;
    import flash.text.TextFormat;

    public /*dynamic*/ interface IChatStyle {

        function get selectorPreview():BitmapData;
        function get isSystemStyle():Boolean;
        function get isHcOnly():Boolean;
        function get isStaffOverrideable():Boolean;
        function getNewBackgroundSprite(k:uint=0xFFFFFF):Sprite;
        function get overlap():Rectangle;
        function get textFormat():TextFormat;

    }
}//package com.sulake.habbo.freeflowchat.style

