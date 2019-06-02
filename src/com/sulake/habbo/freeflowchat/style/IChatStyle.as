package com.sulake.habbo.freeflowchat.style
{
    import flash.display.BitmapData;
    import flash.display.Sprite;
    import flash.geom.Rectangle;
    import flash.text.TextFormat;

    public interface IChatStyle 
    {
        function get selectorPreview():BitmapData;
        function get isSystemStyle():Boolean;
        function get isHcOnly():Boolean;
        function get isAmbassadorOnly():Boolean;
        function get isStaffOverrideable():Boolean;
        function getNewBackgroundSprite(_arg_1:uint=0xFFFFFF):Sprite;
        function get overlap():Rectangle;
        function get textFormat():TextFormat;
    }
}
